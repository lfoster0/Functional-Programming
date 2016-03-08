#lang racket

; Question 15
(define (sublist k xs)
  (cond
    [ (= k 0) '(())]
    [ (null? xs) '()]
    [ else (append (map (lambda (ys) (cons (car xs) ys)) (sublist (- k 1) (cdr xs))) (sublist k (cdr xs))) ]
  )
)

; Question 17
(define (question17)
  (let ([list (sublist 10 (range 1 41))])
    (findAnswer list)
  )
 )

(define (findAnswer lists)
  (if (matches (car lists)) (car lists) (cdr lists)))

(define (matches list)
  (let ([x (car (cdr list))]
        [y (car (cdr (cdr (cdr list))))]
        [z (car (cdr (cdr (cdr (cdr list)))))]
        [first (car list)]
        [third (car (cdr (cdr list)))])
    (if (and (= 16 (+ x y z)) (= first 2) (= third 4)) #t #f)
  )
)
