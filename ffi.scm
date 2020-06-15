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

(import (chicken foreign))
(import foreigners)

 ;; Set up the accessors for Vec3 struct
(define-foreign-record-type (vec3 Vec3)
  (float x vec3_x vec3_x!)
  (float y vec3_y vec3_y!)
  (float z vec3_z vec3_z!))

(let ((v (vec3_create 4.4 5.5 6.6)))
  (display (vec3_x v)) ; Display value of x
  (newline)
  
  (vec3_x! v 7.7) ; Set x to 7.7
  (display (vec3_x v)) ; Display value of x
  (newline))

;; Set up the enum for Keys enum
(define-foreign-enum-type (keys int)
  (keys->int int->keys)
  ((up keys/up) UP)
  ((right keys/right) RIGHT)
  ((down keys/down) DOWN)
  ((left keys/left) LEFT))

(display keys/right)
(newline)

(define key_print
  (foreign-lambda*
   void
   ((int a0))
   "KeyPrint(a0);"))

(key_print keys/left)
