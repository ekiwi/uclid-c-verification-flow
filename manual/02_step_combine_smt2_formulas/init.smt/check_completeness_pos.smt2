; file: pos_n_1.smt
; generated by a call to `klee_dump_expr(.., pos_n)`
; dumped expression
(define-fun |pos_n_1| () (_ BitVec 32) (_ bv0 32))
; path condition under which dumped expression is valid (use in ITE)
(define-fun |path_cond_1| () Bool true)

(define-fun |path_cond_combined| () Bool |path_cond_1|)

; try to find an input for which the combined path condition isn't true
(assert (not |path_cond_combined|))
(check-sat)
