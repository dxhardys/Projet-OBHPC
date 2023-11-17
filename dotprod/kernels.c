//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 dotprod_base(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i] * b[i];

  return d;
}

//UNROLL 8
f64 dotprod_unroll8(f64 *restrict a, f64 *restrict b, u64 n)
{
  #define UNROLL8 8
  double c = 0.0;
  for (u64 i = 0; i < (n - (n & (UNROLL8 - 1))); i += UNROLL8)
    {

    c += a[i] * b[i];
    c += a[i+1] * b[i+1];
    c += a[i+2] * b[i+2];
    c += a[i+3] * b[i+3];
    c += a[i+4] * b[i+4];
    c += a[i+5] * b[i+5];
    c += a[i+6] * b[i+6];
    c += a[i+7] * b[i+7];

    }

// Leftovers
	  for (u64 j = (n - (n & 7)); j < n; j++)
	    c += a[j] * b[j];
  return c;
}



//UNROLL 4
f64 dotprod_unroll4(f64 *restrict a, f64 *restrict b, u64 n)
{
  #define UNROLL4 4
  double c = 0.0;

  for (u64 i = 0; i < (n - (n & (UNROLL4 - 1))); i += UNROLL4)
    {

    c += a[i] * b[i];
    c += a[i+1] * b[i+1];
    c += a[i+2] * b[i+2];
    c += a[i+3] * b[i+3];

    }

// Leftovers
	  for (u64 j = (n - (n & 3)); j < n; j++)
	    c += a[j] * b[j];
  return c;
}

f64 dotbrod_cblas(f64 *restrict a, f64 *restrict b, u64 n)
{
  return cblas_ddot(n,a,1,b,1);
}