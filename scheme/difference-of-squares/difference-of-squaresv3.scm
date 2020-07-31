(import (rnrs))
(use-modules (srfi srfi-41))

(define (square x) (* x x))

;; Streams
(define integers
  (stream-cons 1 (stream-map (lambda (x) (+ x 1)) integers)))

(define cumulative-integers
  (stream-cons 1
               (stream-map + (stream-cdr integers) cumulative-integers)))

(define stream-square-of-sum
  (stream-map square cumulative-integers))

(define squares
  (stream-map square integers))

(define stream-sum-of-squares
  (stream-cons 1
               (stream-map + (stream-cdr squares) stream-sum-of-squares)))

;; Exercise procedures
(define (square-of-sum n)
  (stream-ref stream-square-of-sum (- n 1)))

(define (sum-of-squares n)
  (stream-ref stream-sum-of-squares (- n 1)))

(define (difference-of-squares n)
  (- (square-of-sum n)
     (sum-of-squares n)))




