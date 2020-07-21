(import (rnrs))

(define (square x) (* x x))

(define (get-divisors n)
 (define (get-divisors-helper n divisor divisors)
   (cond [(> (square divisor) n) divisors]
	 [(= (mod n divisor) 0)
	  (if (= (square divisor) n)
	      (get-divisors-helper n (+ divisor 1) (cons divisor divisors))
	      (get-divisors-helper n (+ divisor 1) (append
					 (list divisor
					       (div n divisor))
					 divisors)))]
	 [else (get-divisors-helper n (+ divisor 1) divisors)]))
 (get-divisors-helper n 2 '(1)))

(define (aliquot n)
  (when (< n 1)
    (error))
  (apply + (get-divisors n)))

(define (classify n)
  (let ((sum (aliquot n)))
    (cond [(= n 1) 'deficient]
	  [(< sum n) 'deficient]
	  [(> sum n) 'abundant]
	  [else 'perfect])))

