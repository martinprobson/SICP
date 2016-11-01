#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
; Exercise 1.3.  
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
;
(define (Exercise1.3 x y z)
  (sumSquare (car (top2 x y z)) (cdr (top2 x y z)))
  )
(define (square x)
  (* x x)
  )
(define (sumSquare a b)
  (+ (square a) (square b))
  )
(define (min x y)
  (if (< x y) x y)
  )
(define (min3 x y z)
  (min (min x y) z)
  )
(define (top2 x y z)
  (cond 
    ((= (min3 x y z) x) (cons y z))
    ((= (min3 x y z) y) (cons x z))
    (else (cons x y)))
  )
(Exercise1.3 20 40 50)
