(declare-fun initial_4_pos () (_ BitVec 32))

; from step3: left_pos.smt2
(define-fun |uclid_pos_n| () (_ BitVec 32)
        (ite (bvsle initial_4_pos #xffffff9c)
             initial_4_pos
             (bvadd #xffffffff initial_4_pos)))

; from step3: left_success.smt2
(define-fun |uclid_success_n| () Bool (bvsle initial_4_pos #xffffff9c))

