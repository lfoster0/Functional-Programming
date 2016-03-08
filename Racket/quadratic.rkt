#lang racket

(define (discriminant a b c) ( - (* b b) ( * 4 a c)))

(define (quadratic a b c)
  (let ([x (discriminant a b c)])
    (define (calc a b c) (/ (+ (- 0 b) (sqrt x)) (* 2 a)))
    (cond
      [ (< x 0) +nan.0]
      [ ( = x 0) (let ([y (calc a b c)]) (cons y y))]
      [ else (cons (calc a b c) (- 0 (calc a (- 0 b) c)))]
    )
  )
)