(declare-fun initial_4_pos () (_ BitVec 32))
(assert (bvsle #x00000064 initial_4_pos))


(check-sat)
(get-info :all-statistics)
