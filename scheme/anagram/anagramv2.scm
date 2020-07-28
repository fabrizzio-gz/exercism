(import (rnrs))

(define (same-char-count? list-target target word)
  (cond [(null? list-target) #t]
	[(= (string-count target (car list-target))
	    (string-count word (car list-target)))
	 (same-char-count? (cdr list-target) target word)]
	[else #f]))

(define (is-anagram? target word)
  (let ((target-d (string-downcase target))
	(word-d (string-downcase word)))
    (and (= (string-length target-d)
            (string-length word-d))
         (not (string=? target-d word-d))
         (same-char-count? (string->list target-d)
                           target-d
                           word-d))))

(define (anagram target words)
  (filter (lambda (word) (is-anagram? target word))
          words))
