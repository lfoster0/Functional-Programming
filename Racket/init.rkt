#lang racket

(define (init xs)
  (cond
    ((null? xs) xs)
    ((null? (cdr xs)) `())
    (else (cons (car xs) (init (cdr xs))))
    )
  )