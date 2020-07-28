(import (rnrs))

(define (same-char-count? list-target target word)
  (cond [(null? list-target) #t]
	[(= (string-count target (car list-target))
	    (string-count word (car list-target)))
	 (same-char-count? (cdr list-target) target word)]
	[else
	 #f]))

(define (is-anagram? target word)
  (let ((target-d (string-downcase target))
	(word-d (string-downcase word)))
    (cond [(= (string-length target-d)
	      (string-length word-d))
	   (cond [(string=? target-d word-d)
		  #f]
		 [(same-char-count? (string->list target-d) target-d word-d)
		  #t]
		 [else
		  #f])]
	  [else
	   #f])))

(define (anagram target words)
  (cond [(null? words) '()]
	[(is-anagram? target (car words))
	 (cons (car words)
	       (anagram target (cdr words)))]
	[else
	 (anagram target (cdr words))]))
