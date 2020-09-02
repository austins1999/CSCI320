#lang racket
;Sam Austin
;CSCI320-S20-Assign2-SHA.rkt

;1
(define (make_list_size n e)
  (cond
    ((zero? n) '())
    (else (cons e (make_list_size(- n 1) e)))
  )
)
;tests
(make_list_size 4 2)
(make_list_size 3 '(1 a))
(make_list_size 3 (+ 3 2))

;2
(define (zeros lst)
  (cond
    ((null? lst) 0)
    ((zero? (car lst)) (+ 1 (zeros (cdr lst)) ))
    (else (zeros (cdr lst)))
  )
)
;tests
(zeros '(0 0 0))
(zeros '(0 1 0 1))
(zeros '(10 2 3))
(zeros '())

;3
(define (remove lst a)
  (cond
    ((null? lst) '())
    ((eq? (car lst) a) (remove (cdr lst) a))
    (else (cons (car lst) (remove (cdr lst) a)))
   )
)
;tests
(remove '(2 3 2 4) 2)
(remove '(1 2 a (a b) a 3) 'a)

;4
(define (largest lst)
  (cond
    ((= (length lst) 0) '())
    ((= (length lst) 1) (car lst))
    ((> (car lst) (largest (cdr lst))) (car lst))
    (else (largest (cdr lst)))
  )
)
;tests
(largest '())
(largest '(1 2 3))
(largest '(5 3 2 6 1))