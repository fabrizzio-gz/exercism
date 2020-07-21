;#lang sicp
(import (rnrs))

(define (transcription nuc)
    (cond [(char=? nuc #\G) #\C]
          [(char=? nuc #\C) #\G]
          [(char=? nuc #\T) #\A]
          [(char=? nuc #\A) #\U]
          [else (error "Invalid nucleotide ---" nuc)]))

(define (string-map fun string)
  (list->string
   (map fun (string->list string))))

(define (dna->rna dna)
  (string-map transcription dna))
