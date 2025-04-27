(define (square n) (* n n))

(define (pow base exp) (if (= exp 0) 1 (* (square (pow base (quotient exp 2))) (if (= (modulo exp 2) 1) base 1))))

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let (_________________)
        (* y y y))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) 'YOUR-CODE-HERE)

(define (caddr s) 'YOUR-CODE-HERE)
