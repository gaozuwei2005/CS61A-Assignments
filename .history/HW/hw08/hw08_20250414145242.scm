(define (ascending? s) (or (null? s) (null? (cdr s)) (and (<= (car s) (car (cdr s))) (ascending? (cdr s)))))

(define (my-filter pred s) )

(define (interleave lst1 lst2) 'YOUR-CODE-HERE)

(define (no-repeats s) 'YOUR-CODE-HERE)
