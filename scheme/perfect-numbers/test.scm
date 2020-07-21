(import (except (rnrs) current-output-port))

(define test-fields '(input output))

(define (test-run-solution solution input)
  (if (procedure? solution) (apply solution input) solution))

(define (test-success description success-predicate
         procedure input output)
  (call/cc
    (lambda (k)
      (let ([out (open-output-string)])
        (with-exception-handler
          (lambda (e)
            (let ([result `(fail
                             (description . ,description)
                             (input . ,input)
                             (output . ,output)
                             (stdout . ,(get-output-string out)))])
              (close-output-port out)
              (k result)))
          (lambda ()
            (let ([result (parameterize ([current-output-port out])
                            (test-run-solution procedure input))])
              (unless (success-predicate result output)
                (error 'exercism-test
                  "test fails"
                  description
                  input
                  result
                  output)))
            (let ([result `(pass
                             (description . ,description)
                             (stdout . ,(get-output-string out)))])
              (close-output-port out)
              result)))))))

(define (test-error description procedure input)
  (call/cc
    (lambda (k)
      (let ([out (open-output-string)])
        (with-exception-handler
          (lambda (e)
            (let ([result `(pass
                             (description . ,description)
                             (stdout . ,(get-output-string out)))])
              (close-output-port out)
              (k result)))
          (lambda ()
            (parameterize ([current-output-port out])
              (test-run-solution procedure input))
            (let ([result `(fail
                             (description . ,description)
                             (input . ,input)
                             (output . error)
                             (stdout . ,(get-output-string out)))])
              (close-output-port out)
              result)))))))

(define (run-test-suite tests . query)
  (for-each
    (lambda (field)
      (unless (and (symbol? field) (memq field test-fields))
        (error 'run-test-suite
          (format #t "~a not in ~a" field test-fields))))
    query)
  (let-values ([(passes failures)
                (partition
                  (lambda (result) (eq? 'pass (car result)))
                  (map (lambda (test) (test)) tests))])
    (cond
      [(null? failures) (format #t "~%Well done!~%~%")]
      [else
       (format
         #t
         "~%Passed ~a/~a tests.~%~%The following test cases failed:~%~%"
         (length passes)
         (length tests))
       (for-each
         (lambda (failure)
           (format
             #t
             "* ~a~%"
             (cond
               [(assoc 'description (cdr failure)) => cdr]
               [else (cdr failure)]))
           (for-each
             (lambda (field)
               (let ([info (assoc field (cdr failure))])
                 (display "  - ")
                 (write (car info))
                 (display ": ")
                 (write (cdr info))
                 (newline)))
             query))
         failures)
       (error 'test "incorrect solution")])))

(define (run-docker test-cases)
  (write (map (lambda (test) (test)) test-cases)))

(define classify)

(define test-cases
  (list
    (lambda ()
      (test-success
        "Smallest perfect number is classified correctly" eq?
        classify '(6) 'perfect))
    (lambda ()
      (test-success
        "Medium perfect number is classified correctly" eq? classify
        '(28) 'perfect))
    (lambda ()
      (test-success "Large perfect number is classified correctly"
        eq? classify '(33550336) 'perfect))
    (lambda ()
      (test-success
        "Smallest abundant number is classified correctly" eq?
        classify '(12) 'abundant))
    (lambda ()
      (test-success
        "Medium abundant number is classified correctly" eq?
        classify '(30) 'abundant))
    (lambda ()
      (test-success
        "Large abundant number is classified correctly" eq? classify
        '(33550335) 'abundant))
    (lambda ()
      (test-success
        "Smallest prime deficient number is classified correctly"
        eq? classify '(2) 'deficient))
    (lambda ()
      (test-success
        "Smallest non-prime deficient number is classified correctly"
        eq? classify '(4) 'deficient))
    (lambda ()
      (test-success
        "Medium deficient number is classified correctly" eq?
        classify '(32) 'deficient))
    (lambda ()
      (test-success
        "Large deficient number is classified correctly" eq?
        classify '(33550337) 'deficient))
    (lambda ()
      (test-success
        "Edge case (no factors other than itself) is classified correctly"
        eq? classify '(1) 'deficient))
    (lambda ()
      (test-error
        "Zero is rejected (not a natural number)"
        classify
        '(0)))
    (lambda ()
      (test-error
        "Negative integer is rejected (not a natural number)"
        classify
        '(-1)))))

(define (test . query)
  (apply run-test-suite test-cases query))

(let ([args (command-line)])
  (cond
    [(null? (cdr args))
     (load "perfect-numbers.scm")
     (test 'input 'output)]
    [(string=? (cadr args) "--docker")
     (load "perfect-numbers.scm")
     (run-docker test-cases)]
    [else (load (cadr args)) (test 'input 'output)]))

