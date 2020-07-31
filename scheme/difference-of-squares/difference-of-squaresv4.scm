(import (rnrs))

(define (square x) (* x x))

(define (sum-of-integers n)
  (/ (* n (+ n 1)) 2))

(define (square-of-sum n)
  (square (sum-of-integers n)))

(define (sum-of-squares n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6))

(define (difference-of-squares n)
  (- (square-of-sum n)
     (sum-of-squares n)))




