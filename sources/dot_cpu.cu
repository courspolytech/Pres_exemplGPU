#include <stdio.h>
#define imin(a,b) (a<b?a:b)
const int N = 33 * 1024;
int main( void ) {
    float   *a, *b, c;
    // allocate memory on the cpu side
    a = (float*)malloc( N*sizeof(float) );
    b = (float*)malloc( N*sizeof(float) );
    // fill in the host memory with data
    for (int i=0; i<N; i++) {
        a[i] = i;
        b[i] = i*2;
    }
    // finish up on the CPU side
    c = 0;
    for (int i=0; i<N; i++) {
        c += a[i]*b[i];
    }
    #define sum_squares(x)  (x*(x+1)*(2*x+1)/6)
    printf( "Does CPU value %.6g = %.6g ?\n", c,
             2 * sum_squares( (float)(N - 1) ) );
    // free memory on the cpu side
    free( a );
    free( b );
}
