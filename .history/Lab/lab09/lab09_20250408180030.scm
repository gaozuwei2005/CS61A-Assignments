(define (over-or-under num1 num2)
  (cond ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1)))

(define (make-adder num) (lambda (inc) (+ num inc)))

(define (composed f g) 'YOUR-CODE-HERE)

(define (repeat f n) 'YOUR-CODE-HERE)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE)
