(import (rnrs))

(define (id x) x)
(define (double x) (* 2 x))

(define (square n)
  (define (square-cps n f)
    (if (= n 1)
	(f n)
	(square-cps (- n 1) (lambda (x) (f (double x))))))
  (when (or (< n 1) (> n 64))
    (error "Invalid square number ---" n))
  (square-cps n id))

(define (sum-squares n)
  (if (= n 1)
      1
      (+ (square n) (sum-squares (- n 1)))))

(define total
  (sum-squares 64))

