#lang racket
;
; Calculate square roots and stop when our guess squared is within PRECISION of x
; 
;
(define (sqrt x)
  (define PRECISION 0.0001)
  (define (calc-sqrt guess)
    (if (good-enough? guess) guess (calc-sqrt (improve-guess guess)))
    )
  (define (good-enough? guess)
    (< (abs (- (improve-guess guess) guess)) PRECISION))
  (define (improve-guess guess)
    (exact->inexact (average guess (/ x guess))))
  (define (average x y)
    (/ (+ x y) 2))
  ;
  ; Main body (sqrt)
  ;
  (calc-sqrt 1.0))
;
; Test program generate some square roots using old and new methods to compare results of sqrt and sqrt-old
;
; 
;
; Generate a list of powers of base from start to end (end > start)
;
(define (powers base start end)
  (define (power base exponent)
    (cond [(= exponent 0) 1]
          [(= exponent 1) base]
          [(> exponent 1) (* base (power base (- exponent 1)))]
          [(< exponent 0) (/ 1 (* base (power base (- (abs exponent) 1))))]
          )
    )
  
  (if (> start end)
      '()
      (cons (power base start) (powers base (+ start 1) end))
      )
  )
;
;
;
(displayln '"number,sqrt")
(for-each (lambda (x)
            (displayln
             (string-append
              (number->string x) '","
              (number->string (sqrt x))
              )
             )
            )
          (powers 10.0 -5 12)
          )
