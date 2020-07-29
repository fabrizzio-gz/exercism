(import (rnrs))

(define (integers n)
  (define (iter i nums)
    (if (> i n)
        nums
        (iter (+ i 1) (cons i nums))))
  (iter 1 '()))

(define (square x) (* x x))

(define (square-of-sum n)
  (square (fold-left + 0 (integers n))))

(define (sum-of-squares n)
  (fold-left + 0 (map square (integers n))))

(define (difference-of-squares n)
  (- (square-of-sum n)
     (sum-of-squares n)))



