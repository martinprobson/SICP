#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
; Exercise 1.9 - procedure 2 - Iterative Process
;

(define (+ a b)
  (if (= a 0) 
      b 
      (+ (dec a) (inc b))))

(+ 4 5)

; Example 1 - Iterative Process
(+ 4 5)

 (+ (dec 4) (inc 5))
 (+ 3 6)
 (+ (dec 3) (inc 6))
 (+ 2 7)
 (+ (dec 2) (inc 7))
 (+ 1 8)
 (+ (dec 1) (inc 8))
 (+ 0 9)
; 9