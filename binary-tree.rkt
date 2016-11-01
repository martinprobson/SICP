#lang racket
; vim:ts=4:sw=4:sts=4:et:syntax=scheme
;
; Simple Binary tree implementation in Racket.
;
(require pict)
(require pict/tree-layout)

;
; A function to build a tree-layout with a value
;
(define (tree-node value left right)
  (tree-layout #:pict (text value) left right))

;
; Some test trees
;
(define test '("root" ("left" () ()) ("right" () ())))
(define empty-tree '())
(define test2 '("left" () ()))
(define tree 
'(42
 (20
  (12 () () )
  (21 ()
      (35
       (25 () () )
       (39 () () )
       )
      )
  )
 (100 ()
      (211 () ())
      )
 )
  )

; Return the root of a tree
(define (root b-tree)
  (car b-tree))

; return the left children of a tree
(define (left b-tree)
  (if (pair? b-tree) (car (cdr b-tree)) '()))

; return the right children of a tree
(define (right b-tree)
  (if (pair? b-tree) (car (cdr (cdr b-tree))) '()))

; tests
;(root test)
;(left test)
;(right test)

; In Order tree traversal
(define (in-order b-tree)
  (cond [(empty? b-tree) ]
        [(in-order (left b-tree))
         (displayln (root b-tree))
         (in-order (right b-tree))]))

; Draw the tree
(define (draw-tree b-tree)
  (cond [(empty? b-tree) #f]
        [(tree-node (number->string (root b-tree)) (draw-tree (left b-tree)) (draw-tree (right b-tree)))]))


(naive-layered (draw-tree tree))
(in-order tree)


