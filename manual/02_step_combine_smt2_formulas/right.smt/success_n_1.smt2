; generated by a call to `klee_dump_expr(.., success_n)`
(declare-fun pos_in () (Array (_ BitVec 32) (_ BitVec 8) ) )
; dumped expression
(define-fun |success_n_1| () (_ BitVec 32) (_ bv0 32))
; path condition under which dumped expression is valid (use in ITE)
(define-fun |path_cond_1| () Bool (bvslt  (_ bv99 32) (concat  (select  pos_in (_ bv3 32) ) (concat  (select  pos_in (_ bv2 32) ) (concat  (select  pos_in (_ bv1 32) ) (select  pos_in (_ bv0 32) ) ) ) ) ))
