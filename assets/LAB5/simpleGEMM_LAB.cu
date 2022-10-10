/**
 * @author gtyinstinct
 * naive GEMM(int) implemention for demo
 * C = AB
 * A  (M X K) 
 * B  (K X N)
 * C  (M X N)
 **/

#include <cstdlib>
#include <cstdio>
#include <random>
#include <functional>

#define M 128               // matrix shape M in GEMM
#define N 64                // matrix shape N in GEMM
#define K 256               // matrix shape K in GEMM
#define RANGE 256           // data range is [-RANGE/2,RANGE/2)
#define TEST_TIMES 2        // iteration times
#define BLOCK_DIM_MIN 128   // minimum of BLOCK_DIM
#define BLOCK_DIM_MAX 1024  // maximum of BLOCK_DIM 
#define USE_TIMER 1         // 1 means use timer; 0 means without timer

// kernel function
// implement GEMM C=AB
__global__ void 
GEMM_gpu(int *A,int *B,int *C){
    // index in Grid scope
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // row index in C
    int row = idx / N;
    // column index in C
    int col = idx % N;
    // redundant thread do nothing
    if(row>=M)return;
    // init accumulation
    int sum = 0;
    // calculate C[row][col]
    for(int k=0;k<K;k++){
        sum += A[row*K + k] * B[k*N + col];
    }
    // write result to C
    C[row*N + col] = sum;
}

bool
check(int *C_cpu,int *C_gpu){
    for(int i=0;i<M;i++){
        for(int j=0;j<N;j++){
            if(C_cpu[i*N + j] != C_gpu[i*N + j]){
                printf("at (%d,%d) expect %d but got %d\n",i,j,C_cpu,C_gpu);
                return 0;
            }
        }
    }
    return 1;
}

void
GEMM_cpu(int *A,int *B,int *C){
    for(int i=0;i<M;i++){
        for(int j=0;j<N;j++){
            int sum = 0;
            for(int k=0;k<K;k++){
                sum += A[i*K + k] * B[k*N + j];
            }
            C[i*N +j] = sum;
        }
    }
}

void 
initVal(int *arr,size_t size){
    for(int i=0;i<size;i++){
        arr[i] = rand() % RANGE - RANGE/2; // [-RANGE/2,RANGE/2)
    }
}

void Timer(const char *tag, const std::function<void()> &kernel,
            int test_time=1) {
  for (int i = 0; i < test_time; ++i) {
    cudaEvent_t beg, end;
    cudaEventCreate(&beg);
    cudaEventCreate(&end);
    cudaEventRecord(beg);
    kernel();
    cudaEventRecord(end);
    cudaEventSynchronize(beg);
    cudaEventSynchronize(end);
    float elapsed_time;
    cudaEventElapsedTime(&elapsed_time, beg, end);
    printf("[%s] iter %d: %f ms elapsed\n", tag, i,elapsed_time);
  }
}

int 
main(){
  #if USE_TIMER==1
    printf("Timer:ON\n");
  #else
    printf("Timer:OFF\n");
  #endif 
    printf("M:%d N:%d K:%d\n",M,N,K);

    // set magic number for seed
    srand(8);

    // malloc mem for A B C 
    // h:host pointer,d:device pointer
    int *A_h,*A_d,*B_h,*B_d,*C_h,*C_d;
    size_t A_size,B_size,C_size;
    // calculate size(byte) for A B C
    A_size = M*K*sizeof(int);
    B_size = K*N*sizeof(int);
    C_size = M*N*sizeof(int);
    // malloc on host CPU (row major)
    A_h = (int *)malloc(A_size);
    B_h = (int *)malloc(B_size);
    C_h = (int *)malloc(C_size);
    // malloc on device GPU (row major)
    cudaMalloc(&A_d,A_size);
    cudaMalloc(&B_d,B_size);
    cudaMalloc(&C_d,C_size);

    // init val for A B at host memory
    initVal(A_h,A_size/sizeof(int));
    initVal(B_h,B_size/sizeof(int));

    // copy A B from host to device memory
    cudaMemcpy(A_d,A_h,A_size,cudaMemcpyHostToDevice);
    cudaMemcpy(B_d,B_h,B_size,cudaMemcpyHostToDevice);

    // launch kernel on GPU
    int GridDim,BlockDim;
    BlockDim = min(BLOCK_DIM_MAX,N); // let BlockDim <= BLOCK_DIM_MAX
    BlockDim = max(BLOCK_DIM_MIN,BlockDim); // let BlockDim >= BLOCK_DIM_MIN
    GridDim = M*N/BlockDim; // launch thread num M*N 
    GridDim = max(1,GridDim); // let GridDim >= 1
    printf("GridDim:%d BlockDim:%d\n",GridDim,BlockDim);
  #if USE_TIMER==1
    Timer("GEMM on GPU",[&]{GEMM_gpu<<<GridDim,BlockDim>>>(A_d,B_d,C_d);}
    ,TEST_TIMES);
  #else
    GEMM_gpu<<<GridDim,BlockDim>>>(A_d,B_d,C_d); 
  #endif
    

    // copy C from device to host memory
    cudaMemcpy(C_h,C_d,C_size,cudaMemcpyDeviceToHost);

    // Test GEMM on CPU
    int *C_cpu = (int *)malloc(C_size);
  #if USE_TIMER==1
    Timer("GEMM on CPU",[&]{GEMM_cpu(A_h,B_h,C_cpu);}
    ,TEST_TIMES);
  #else 
    GEMM_cpu(A_h,B_h,C_cpu);
  #endif

    // check result
    if(check(C_cpu,C_h)){
        printf("check pass!\n");
    }else{
        printf("check fail\n");
    }
}