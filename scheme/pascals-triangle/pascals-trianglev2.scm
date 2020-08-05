(import (rnrs))

(define (pairwise-sum row)
  (define (iter row next-row)
    (if (null? (cdr row))
        next-row
        (iter (cdr row)
              (append next-row
                      (list (+ (car row)
                               (cadr row)))))))
  (iter row '()))

(define (next-pascal-row row)
  (let ((l (length row)))
    (if (= l 0)
        '(1)
        (append '(1)
                (pairwise-sum row)        
                '(1)))))

(define (pascals-triangle n)
  (define (iter c row triangle)
    (if (= c n)
        (cons row triangle)
        (iter (+ c 1)
              (next-pascal-row row)
              (cons row
                    triangle)
          )))
  (if (= n 0)
      '()
      (reverse (iter 1 '(1) '()))))




