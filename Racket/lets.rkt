#lang racket

; Regular let. Here derp takes x and y as the arguments passed
; to the function since it doesn't know about the x above it or y below it.
(define (lets_reg x y)
  (let ([x  2]
        [derp (+ x y)]
        [y 4]) derp)
  )

; Using let* now gives derp a reference to everything above it, so it uses the
; x defined as two above it, but still the y from the argument passed in
(define (lets_star x y)
  (let* ([x  2]
        [derp (+ x y)]
        [y 4]) derp)
  )

; Using letrec gives derp a reference to everything in the let block above
; or below so now it sees x and y as 2 and 4
(define (lets_rec x y)
  (letrec ([x  2]
        [derp (+ x y)]
        [y 4]) derp)
  )