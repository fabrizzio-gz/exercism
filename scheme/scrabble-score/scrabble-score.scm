(import (rnrs))

(define val-1 (cons
	       (string->list "aeioulnrst")
	       1))
(define val-2 (cons
	       (string->list "dg")
	       2))
(define val-3 (cons
	       (string->list "bcmp")
	       3))
(define val-4 (cons
	       (string->list "fhvwy")
	       4))
(define val-5 (cons
	       (string->list "k")
	       5))
(define val-8 (cons
	       (string->list "jx")
	       8))
(define val-10 (cons
	       (string->list "qz")
	       10))

(define value-list (list val-1 val-2 val-3 val-4 val-5 val-8 val-10))

(define (get-value char value-list)
  (let ((char-list (caar value-list))
	(value (cdar value-list)))
    (if (member? char char-list)
	value
	(get-value char (cdr value-list)))))

(define (member? char list)
  (cond [(null? list) #f]
	[(eqv? char (car list)) #t]
	[else (member? char (cdr list))]))



(define (score word)
  (define (helper word-list score)
    (cond [(null? word-list) score]
	  [else (helper (cdr word-list) (+ score
					   (get-value (car word-list)
						      value-list)))]))
  (helper (string->list (string-downcase word)) 0))

