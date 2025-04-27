(define (curry-cook formals body) 
  (if (cdr formals)
    (lambda (f b) (curry-cook f b))
    (lambda (car formals) body)
  )
)

(define (curry-consume curry args)
  'YOUR-CODE-HERE)

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))

(define (switch-to-cond switch-expr)
  (cons _________
        (map (lambda (option)
               (cons _______________ (cdr option)))
             (car (cdr (cdr switch-expr))))))
