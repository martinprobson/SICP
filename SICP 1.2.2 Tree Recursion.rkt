#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
; The procedure below calculates the nth Fibonacci number.
;
;   It is 'Tree recursive' and therefore very inefficient.
;

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
	
;___________________________________________________________________________________________________________
;eg (fib 10)

(+ (fib 9) (fib 8))
    (+ (+ (fib 8) (fib 7)) (+ (fib 7) (fib 6)))
        (+ (+ (+ (fib 7) (fib 6)) (+ (fib 6) (fib 5))) (+ (+ (fib 6) (fib 5)) (+ (fib 5) (fib 4))))
            (+ (+ (+ (+ (fib 6) (fib 5)) (+ (fib 5) (fib 4))) (+ (+ (+ (fib 5) (fib 4)
