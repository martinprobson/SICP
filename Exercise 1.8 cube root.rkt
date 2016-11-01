#lang racket
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
(define (cube_root x)
      (calc_cube_root 1.0 x))
;
(define (calc_cube_root guess x)
    (if (good_enough? guess x) guess (calc_cube_root (improve_guess guess x) x))
    )
;
;
(define (power base exponent)
  (cond [(= exponent 0) 1]
        [(= exponent 1) base]
        [(> exponent 1) (* base (power base (- exponent 1)))]
        [(< exponent 0) (/ 1 (* base (power base (- (abs exponent) 1))))]
        )
  )
;
;
(define (sqr x)
  (power x 2))
;
;
(define (cube x)
  (power x 3))
;
;
(define (good_enough? guess x)
  (< (abs (- (cube guess) x)) 0.0000000001))
;  
(define (improve_guess guess x)
  (exact->inexact (average guess
                           (/ (+ (/ x (sqr guess) ) (* 2 guess)) 3)
                           )
                  )
  )
;
(define (average x y)
  (/ (+ x y) 2))
;
(for ([x (in-range 2.0 100.0)])
  (displayln (string-append (number->string (cube_root x)) '"\t" (number->string x) '"\t" (number->string (power (cube_root x) 3)))))

