#lang racket
;Sam Austin
;CSCI320-S20-Assign1-SHA.rkt

;1
(car(cdr(cdr '(a b x d) )))
(car(car(cdr(car(cdr '(a (b (x d))) )))))
(car(car(cdr(car(cdr(car(car '(((a (b (x) d)))) )))))))

;2
(cons 'a (cons 'b (cons 'x (cons 'd '()))))
(cons 'a (cons (cons 'b (cons (cons 'x (cons 'd '())) '())) '()))
(cons (cons (cons 'a (cons (cons 'b (cons (cons 'x '()) (cons 'd '())) ) '()) ) '()) '())

;3
;car
(define (head array)
  (car array)
)
(head '(a b c))
;cdr
(define (tail array)
  (cdr array)
)
(tail '(a b c))

;4
;using list
(define (switchA array)
  (list (car(cdr array)) (car array))
)
(switchA '(a 1))
;using cons
(define (switchB array)
  (cons (car(cdr array)) (cons (car array) '()))
)
(switchB '(b 2))

;5
(define (addLength array)
  (cons (length array) array)
)
(addLength '(a b c d))

;6
(define (distance p1 p2)
  (sqrt (+(sqr(-(car p2) (car p1))) (sqr(-(car (cdr p2)) (car (cdr p1))))))
)
(distance '(3 -1) '(5 6))