(import (rnrs))

(define (pairwise-sum row)
  (define (iter row next-row)
    (if (null? (cdr row))
        (append next-row (list 1))
        (iter (cdr row)
              (append next-row
                      (list (+ (car row)
                               (cadr row)))))))
  (iter row '(1)))

(define (next-pascal-row row)
  (let ((l (length row)))
    (cond [(= 0 l) '(1)]
          [(= 1 l) '(1 1)]
          [else (pairwise-sum row)])))

(define (pascals-triangle n)
  (define (iter c row triangle)
    (cond [(= c n) (append triangle (list row))]
          [else
           (iter (+ c 1)
                 (next-pascal-row row)
                 (append triangle
                         (list row)))]))
  (if (= n 0)
      '()
      (iter 1 '(1) '())))




