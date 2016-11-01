#lang sicp
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
; Exercise 1.9 - procedure 1  - Linear Recursive.
;
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))
      )
  )
;
; Test
(+ 1000 (+ 40 (+ 4 5)))

; Example : -
(+ 4 5)

(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
