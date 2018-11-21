(declare-fun initial_4_pos () (_ BitVec 32))
(assert (bvsle initial_4_pos #xffffff9c))


(check-sat)
(get-info :all-statistics)
