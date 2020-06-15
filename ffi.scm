(import (chicken foreign))

(foreign-declare "#include \"ffi.h\"")

(define vec3_print
  (foreign-lambda*
   void
   (((c-pointer (struct "Vec3")) a0))
   "Vec3Print(*a0);"))

(define vec3_create
  (foreign-lambda*
   (c-pointer (struct "Vec3"))
   ((float x)
    (float y)
    (float z))
   "C_return(Vec3Create(x, y, z));"))

(define vec3_zero
  (foreign-lambda*
   (c-pointer (struct "Vec3"))
   ()
   "Vec3* v = (Vec3*)Vec3Create(0.0f, 0.0f, 0.0f);
C_return(v);"))

(vec3_print (vec3_zero))
(vec3_print (vec3_create 1.1 2.2 3.3))
