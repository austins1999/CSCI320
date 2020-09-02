#lang racket

;---1) COMPLEX NUMBERS ---
;real part (a)
(define (real num)
  (car num)
)

;complex part (b)
(define (complex num)
  (car (cdr num))
)

;complement
(define (compl num)
  (cons (real num) (list (- 0 (complex num))))
)

;absolute value
(define (abs num)
  (sqrt (+ (* (real num) (real num)) (* (complex num) (complex num))))
)

;checks for equality
(define (equal? num1 num2)
  (cond
    ((= (real num1) (real num2))
     (cond
       ((= (complex num1) (complex num2)) #t)
       (else #f)
    ))
    (else #f)
  )
)

;addition
(define (plus num1 num2)
  (cons (+ (real num1) (real num2)) (list (+ (complex num1) (complex num2))))
)

;subtraction
(define (minus num1 num2)
  (cons (- (real num1) (real num2)) (list (- (complex num1) (complex num2))))
)

;multiplication
(define (prod num1 num2)
  (cons (- (* (real num1) (real num2)) (* (complex num1) (complex num2))) (list (+ (* (real num1) (complex num2)) (* (real num2) (complex num1)))))
)

;division
(define (quotient num1 num2)
  (cons (/ (+ (* (real num1) (real num2)) (* (complex num1) (complex num2))) (+ (* (real num2) (real num2)) (* (complex num2) (complex num2)))) (list (/ (- (* (real num2) (complex num1)) (* (real num1) (complex num2))) (+ (* (real num2) (real num2)) (* (complex num2) (complex num2))))))
)

;tests
(real '(2.5 3.7))
(complex '(2.5 3.7))
(compl '(2.5 3.7))
(abs '(2.5 3.7))
(equal? '(2.5 3.7) '(2.5 3.7))
(equal? '(2.5 3.7) '(2.5 3.8))
(equal? '(2.5 3.7) '(2.6 3.7))
(plus '(2.5 3.7) '(2.5 3.7))
(minus '(2.5 3.7) '(2.5 3.7))
(prod '(2.5 3.7) '(2 0))
(quotient '(2.5 3.7) '(2 0))


;---2) BINARY TREE ---
;helper function that checks if item is an atom
(define (atom? x)
  (and (not (list? x)) (not (null? x)))
)

;checks if list is a tree
(define (tree? lst)
  (cond
    ((null? lst) #t)
    ((and (atom? (car lst)) (not (null? (cdr lst))) (list? (car (cdr lst))) (list? (car (cdr (cdr lst)))) (tree? (car (cdr lst))) (tree? (car (cdr (cdr lst))))) #t)
    (else #f)
  )
)

;traverses tree in a preorder fashion
(define (preorder tree)
  (cond
    ((not (tree? tree)) '())
    ((null? tree) '())
    (else (cons (car tree) (append (preorder (car (cdr tree))) (preorder (car (cdr (cdr tree)))))))
  )
)

;traverses tree in an inorder fashion
(define (inorder tree)
  (cond
    ((not (tree? tree)) '())
    ((null? tree) '())
    (else (append (inorder (car (cdr tree))) (list (car tree)) (inorder (car (cdr (cdr tree))))))
  )
)
  

;traverses tree in a postorder fashion
(define (postorder tree)
  (cond
    ((not (tree? tree)) '())
    ((null? tree) '())
    (else (append (append (postorder (car (cdr tree))) (postorder (car (cdr (cdr tree))))) (list (car tree))))
  )
)

;tests
(tree? '())
(tree? '(a b))
(tree? '(a))
(tree? '(a (b () (c () ()))(d () (e (f () ()) ()))))
(preorder '(a (b () (c () ()))(d () (e (f () ()) ()))))
(inorder '(a (b () (c () ()))(d () (e (f () ()) ()))))
(postorder '(a (b () (c () ()))(d () (e (f () ()) ()))))