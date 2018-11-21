(declare-fun initial_4_pos () (_ BitVec 32))
(assert (not (= initial_4_pos
        (ite (bvsle #x00000064 initial_4_pos)
             initial_4_pos
             (bvadd #x00000001 initial_4_pos)))))


(check-sat)
(get-info :all-statistics)
