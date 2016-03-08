#lang racket

(define (curry f) (lambda (x) (lambda (y) (f x y))))

(define (plus x y) ( + x y))