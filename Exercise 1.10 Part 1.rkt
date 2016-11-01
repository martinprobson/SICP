#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
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
; Exercise 1.10 - The following procedure computes a mathematical function called Ackermann's function.
;
;                 What are the values of the following expressions?
;
;                     (A 1 10)
;                     (A 2 4)
;                     (A 3 3)
;
;
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
;
; Some assertions
;
(= (A 2 2) (A 1 2))
(= (A 2 2) (power 2 2))
;
(= (A 2 3) (A 1 (A 1 2)))
(= (A 2 3) (A 1 (power 2 2)))
(= (A 2 3) (power 2 4))                           ; 2^2 3 times (i.e 2 followed by 3 ^2)  ????????
;
(= (A 2 4) (A 1 (A 1 (A 1 2))))
(= (A 2 4) (A 1 (A 1 (power 2 2))))
(= (A 2 4) (power (power 2 4) 4))                 ; 2^2 4 times (i.e 2 followed by 4 ^2)

;
(= (A 2 5) (A 1 (A 1 (A 1 (A 1 2)))))
(= (A 2 5) (A 1 (A 1 (A 1 (power 2 2)))))
(= (A 2 5) (power 2 65536))                       ; 2^2 16 times (i.e 2 followed by 16 ^2)

(= (power 2 65536) (power (power 2 32768) 2))
(= (power 2 65536) (power (power (power 2 16384) 2) 2))
(= (power 2 65536) (power (power (power (power 2 8192) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power 2 4096) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power 2 2048) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power 2 1024) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power 2 512) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power 2 256) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power 2 128) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power 2 64) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power 2 32) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power (power 2 16) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power (power (power 2 8) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power 2 4) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power 2 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
(= (power 2 65536) (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power (power 2 1) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2))
;(= (A 2 5) (power 2 2028))

(define (check exponent)
  (= (A 2 5) (power 2 exponent))
  )

(define (tester start end)
  (if (> start end)
      'Done!
  (if (check start)
      (display (string-append '"Found!" '" " (number->string start)))
      (tester (* start 2) end)
      ))
  )

;
; Now let's run our test
;
(tester 4096 (power 2 32))
;
      
