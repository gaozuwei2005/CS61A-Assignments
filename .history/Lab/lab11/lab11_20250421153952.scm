(define (if-program condition if-true if-false)
  (list 'if condition if-true if-false))

(define (square n) (* n n))

(define (pow-expr base exp) 
  (cond
    ((zero? exp) 1)
    ((odd? exp) (list '* base (pow-expr base (- exp 1))))
    (else (list 'square (pow-expr base (quotient exp 2))))
  )
)

(define-macro (repeat n expr)
  `(repeated-call ,n (lambda () expr)))

; Call zero-argument procedure f n times and return the final result.
(define (repeated-call n f)
  (if (= n 1)
      
      (begin ___ ___)))
