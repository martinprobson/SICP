#lang racket
;
; Deal with exponent = 1 and -1
; Deal with exponent = 0
;
(define (power base exponent)
  (cond [(= exponent 0) 1]
        [(= exponent 1) base]
        [(> exponent 1) (* base (power base (- exponent 1)))]
        [(< exponent 0) (/ 1 (* base (power base (- (abs exponent) 1))))]
        )
  )
; (for ([x (in-range -10.0 10.0)])
;   (for ([pow (in-range -4.0 4.0)])
;     (display (string-append (number->string x) '"\t" (number->string (power x pow)) '"\t"))
;     )e
;   (displayln '" ")
;   )
(define (powers base start end)
  (if (> start end)
      '()
      (cons (power base start) (powers base (+ start 1) end))
      )
  )