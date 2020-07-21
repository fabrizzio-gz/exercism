(import (rnrs))

(define (convert number)
  (define (factor-of? x)
    (zero? (remainder number x)))
  (define (test-factor factor message)
    (if (factor-of? factor)
	message
	""))
  (let ((result (string-append (test-factor 3 "Pling")
			       (test-factor 5 "Plang")
			       (test-factor 7 "Plong"))))
    (if (string=? result "")
	(number->string number)
	result)))

