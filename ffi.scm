(foreign-declare "#include \"ffi.h\"")

;; Foreign lambda binds to the C function Vec3Create
(define vec3_create
  (foreign-lambda
   (c-pointer (struct "Vec3"))
   "Vec3Create"
   float float float))

;; With Foreign-Lambda* we could specify c-code
(define vec3_print
  (foreign-lambda*
   void
   (((c-pointer (struct "Vec3")) a0))
   "Vec3Print(*a0);"))

(define vec3_zero
  (foreign-lambda*
   (c-pointer (struct "Vec3"))
   ()
   "Vec3* v = (Vec3*)Vec3Create(0.0f, 0.0f, 0.0f);
C_return(v);"))

(vec3_print (vec3_zero))
(vec3_print (vec3_create 1.1 2.2 3.3))

;; We should also make sure to free the memory afterwards
(define free (foreign-lambda void "free" c-pointer))

(let ((v (vec3_zero)))
  (vec3_print v)
  (free v))

;; We import the foreigners extension
;; This would allow us to use define-foreign-record-type
;; And define-foreign-enum-type macros
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
  
  (vec3_x! v 7.7)      ; Set x to 7.7
  (display (vec3_x v)) ; Display value of x
  (newline)

  (free v))

;; Set up the enum for Keys enum
(define-foreign-enum-type (keys int)
  (keys->int int->keys)
  ((up keys/up) UP)
  ((right keys/right) RIGHT)
  ((down keys/down) DOWN)
  ((left keys/left) LEFT))

(display keys/right)
(newline)

;; Bind to KeyPrint C function
(define key_print
  (foreign-lambda*
   void
   ((int a0))
   "KeyPrint(a0);"))

(key_print keys/left)
