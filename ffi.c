#include "ffi.h"
#include <stdio.h>

void Vec3Accept(Vec3 v)
{
	printf("v (%f, %f, %f)\n", v.x, v.y, v.z);
}
