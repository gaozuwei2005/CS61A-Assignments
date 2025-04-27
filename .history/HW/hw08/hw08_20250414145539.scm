(define (ascending? s) (or (null? s) (null? (cdr s)) (and (<= (car s) (car (cdr s))) (ascending? (cdr s)))))

(define (my-filter pred s) 
    (if (null? s) 
        s 
        (if (pred car s) 
            (cond (car s) (my-filter))
            
        )
    )
)

(define (interleave lst1 lst2) 'YOUR-CODE-HERE)

(define (no-repeats s) 'YOUR-CODE-HERE)
