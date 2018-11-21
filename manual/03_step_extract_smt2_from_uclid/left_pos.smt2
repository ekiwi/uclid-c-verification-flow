(declare-fun initial_4_pos () (_ BitVec 32))
(assert (not (= initial_4_pos
        (ite (bvsle initial_4_pos #xffffff9c)
             initial_4_pos
             (bvadd #xffffffff initial_4_pos)))))


(check-sat)
(get-info :all-statistics)
