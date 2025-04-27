(define (if-program condition if-true if-false)
  (list 'if condition if-true if-false))

(define (square n) (* n n))

(define (pow-expr base exp) 
  (if (odd? exp)
    (list '* base (pow-expr base (- exp 1)))
    (list 'square (pow-expr base (quotient exp 2)))
  )
)

(define-macro (repeat n expr)
  `(repeated-call ,n ___))

; Call zero-argument procedure f n times and return the final result.
(define (repeated-call n f)
  (if (= n 1)
      ___
      (begin ___ ___)))
