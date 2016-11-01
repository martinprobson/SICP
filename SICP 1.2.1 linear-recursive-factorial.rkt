#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
;
; A linear recursive version of factorial function
;
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))
      )
  )

(factorial 6)