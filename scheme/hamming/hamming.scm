(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (define (hamming-distance-list list-a list-b)
    (fold-right (lambda (a b acc)
		  (if (char=? a b)
		      acc
		      (+ 1 acc)))
		0
		list-a
		list-b))
  (unless (= (string-length strand-a)
		  (string-length strand-b))
    (error ("Strands of unmatching length ---")))
  (hamming-distance-list (string->list strand-a)
			 (string->list strand-b)))

