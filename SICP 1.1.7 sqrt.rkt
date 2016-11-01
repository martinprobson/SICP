#lang racket
;
; Calculate square roots and stop when our guess squared is within PRECISION of x
;
(define (sqrt-old x)
  (calc-sqrt-old 1.0 x))
;
; Exercise 1.7 - Calculate square roots and stop when the difference between guesses is within PRECISION. This method works
; better for both large and small values of x.
;
(define (sqrt x)
  (calc-sqrt 1.0 x))
;
; define precision constant
;
(define PRECISION 0.0001)
;
(define (calc-sqrt guess x)
    (if (good-enough? guess x) guess (calc-sqrt (improve-guess guess x) x))
    )

(define (calc-sqrt-old guess x)
    (if (good-enough-old? guess x) guess (calc-sqrt-old (improve-guess guess x) x))
    )
;
(define (sqr x)
  (* x x))
;
(define (good-enough-old? guess x)
  (< (abs (- (sqr guess) x)) PRECISION))
;
;
; Exercise 1.7 - Second version of improve guess - watch how guess changes from one interation to the next
; and stop when the change is a very small fraction of the guess.
;
(define (good-enough? guess x)
  (< (abs (- (improve-guess guess x) guess)) PRECISION))

(define (improve-guess guess x)
  (exact->inexact (average guess (/ x guess))))


(define (average x y)
  (/ (+ x y) 2))
;
; For exercise 1.6
;
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;(square_root 2)
;    (displayln new_guess)
;    (displayln (* new_guess new_guess))

;
; Test program generate some square roots using old and new methods to compare results of sqrt and sqrt-old
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
; Generate a list of powers of base from start to end (end > start)
;
(define (powers base start end)
  (if (> start end)
      '()
      (cons (power base start) (powers base (+ start 1) end))
      )
  )
;
;
;
(displayln '"number,sqrt_old,sqrt_new")
(for-each (lambda (x)
            (displayln
             (string-append
              (number->string x) '","
              (number->string (sqrt-old x)) '","
              (number->string (sqrt x))
              )
             )
            )
          (powers 10.0 -5 12)
          )
;   (for ([pow (in-range -4.0 4.0)])
;     (display (string-append (number->string x) '"\t" (number->string (power x pow)) '"\t"))
;     )e
;   (displayln '" ")
;   )