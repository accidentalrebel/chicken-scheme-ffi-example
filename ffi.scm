(import (chicken foreign))

(foreign-declare "#include \"ffi.h\"")

(define vec3_create
  (foreign-lambda*
   (c-pointer (struct "Vec3"))
   ((float x)
    (float y)
    (float z))
   "Vec3* v = (Vec3*)malloc(sizeof(Vec3));
v->x = x;
v->y = y;
v->z = z;
C_return(v);"))

(define vec3_accept
  (foreign-lambda*
   void
   (((c-pointer (struct "Vec3")) a0))
   "Vec3Accept(*a0);"))

(vec3_accept (vec3_create 1.1 2.2 3.3))

