(declare-fun initial_4_pos () (_ BitVec 32))

; from step3: right_pos.smt2
(define-fun |uclid_pos_n| () (_ BitVec 32)
        (ite (bvsle #x00000064 initial_4_pos)
             initial_4_pos
             (bvadd #x00000001 initial_4_pos)))

; from step3: right_success.smt2
(define-fun |uclid_success_n| () Bool (not (bvsle #x00000064 initial_4_pos)))
