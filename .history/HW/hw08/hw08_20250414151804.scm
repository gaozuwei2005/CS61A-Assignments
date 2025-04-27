(define (ascending? s) (or (null? s) (null? (cdr s)) (and (<= (car s) (car (cdr s))) (ascending? (cdr s)))))

(define (my-filter pred s) 
    (if (null? s) 
        s 
        (if (pred (car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
        )
    )
)

(define (interleave lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1) (interleave lst2 (cdr lst1)))
    )
)

(define (no-repeats s)
    (if (null? s)
        s
        (cons 
            (car s)
            (my-filter (lambda (a b) (not (= a b))) (no-repeats (cdr s)))
        )
    )
)
