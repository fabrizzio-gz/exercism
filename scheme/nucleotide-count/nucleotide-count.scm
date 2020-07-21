(import (rnrs))

(define (nucleotide-count dna)
  (define (count dna A C G T)
    (cond [(null? dna)
	   (list (cons #\A A)
		 (cons #\C C)
		 (cons #\G G)
		 (cons #\T T))]
	  [(char=? (car dna) #\A) (count (cdr dna) (+ A 1) C G T)]
	  [(char=? (car dna) #\C) (count (cdr dna) A (+ C 1) G T)]
	  [(char=? (car dna) #\G) (count (cdr dna) A C (+ G 1) T)]
	  [(char=? (car dna) #\T) (count (cdr dna) A C G (+ T 1))]
	  [else
	   (error "Invalid nucleotide --- COUNT" (car dna))]))
  (count (string->list dna) 0 0 0 0))

