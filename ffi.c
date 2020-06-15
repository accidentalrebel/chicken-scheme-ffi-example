#include "ffi.h"
#include <stdio.h>
#include <stdlib.h>

Vec3* Vec3Create(float x, float y, float z)
{
	Vec3* v = (Vec3*)malloc(sizeof(Vec3));
	v->x = x;
	v->y = y;
	v->z = z;
	return v;
}

void Vec3Print(Vec3 v)
{
	printf("Vec3 to print: (%f, %f, %f)\n", v.x, v.y, v.z);
}

void KeyPrint(enum Keys k)
{
	printf("Key to print: %i\n", k);
}
