(import (rnrs))

(define abc-list
  (string->list "abcdefghijklmnopqrstuvwxyz"))

(define (pangram? phrase)
  (define (char-in? char phrase-list)
    (cond [(null? phrase-list) #f]
	  [(char=? char (car phrase-list)) #t]
	  [else (char-in? char (cdr phrase-list))]))
  (define (test-chars chars phrase-list)
    (if (null? chars)
	#t
	(and (char-in? (car chars)
		       phrase-list)
	     (test-chars (cdr chars) phrase-list))))
  (test-chars abc-list
	      (string->list
	       (string-downcase phrase))))

