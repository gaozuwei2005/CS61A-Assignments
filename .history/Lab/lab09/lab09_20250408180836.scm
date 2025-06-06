(define (over-or-under num1 num2)
  (cond ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1)))

(define (make-adder num) (lambda (inc) (+ num inc)))

(define (composed f g) (lambda (x) (f (g x))))

(define (repeat f n) (
    lambda (x) (if (> n 0) ((repeat f (- n 1)) x) x)
    )
  )
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE)
