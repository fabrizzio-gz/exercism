(import (rnrs))

(define (binary-search array target)
  (define (binary-search-ind start end)
    (let ((mid (+ start
		  (quotient (- end start) 2))))
      (let ((array-target (vector-ref array mid)))
	(cond [(=  array-target target)
	       mid]
	      [(or (= start mid) (= end mid))   
	       'not-found]
	      [(> array-target target)
	       (binary-search-ind start (- mid 1))]
	      [else (binary-search-ind (+ mid 1) end)]))))
  (if (= (vector-length array) 0)
      'not-found
      (binary-search-ind 0 (- (vector-length array) 1)))
  )
