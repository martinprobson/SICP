#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
;
; A linear iterative process for factorials
;
(define (factorialI n) 
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorialI 6)