#lang racket
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
;                     SICP Section 1.2.2 Tree Recursion
;
; The procedure below calculates the nth Fibonacci number.
;
;   It is 'Tree recursive' (and therefore inefficient).
;
; In order to show this, the fib-tree procedure builds the evaluation tree for a given Fibonacci number.
;
; Notice how this is a terrible way to calculate Fibonacci numbers as repeated calcuations of the same
; values occur in different branches of the tree (for example for (fib 9), (fib 6) is calculated 3 times.
;
(require pict)
(require pict/tree-layout)


(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib-tree n)
  ; Helper function to build tree-layouts
  (define (tree-node value left right)
  (tree-layout #:pict (text (number->string value)) left right))
  ; Main body - replicate the fib procedure above
  (cond [(= n 0) (tree-node 0 #f #f)]
        [(= n 1) (tree-node 1 #f #f)]
        [else (tree-node n (fib-tree (- n 1)) (fib-tree (- n 2)))]))

	
; Show the tree for 9 
(naive-layered  (fib-tree 20 ))

