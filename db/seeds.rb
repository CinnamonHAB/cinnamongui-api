domain = Domain.create!({name: "default_domain"})

fp = domain.floorplans.create!

pred = {}
pred[:lamp] = domain.predicates.create!({keyword: "LAMP", predicate_type: :device})
pred[:switch] = domain.predicates.create!({keyword: "SWITCH", predicate_type: :device})
pred[:affects] = domain.predicates.create!({keyword: "AFFECTS", predicate_type: :link})
pred[:group] = domain.predicates.create!({keyword: "GROUP", predicate_type: :other})
pred[:in] = domain.predicates.create!({keyword: "IN", predicate_type: :other})

pred[:lamp].predicate_params.create!({name: "l", param_type: nil})
pred[:switch].predicate_params.create!({name: "s", param_type: nil})
pred[:affects].predicate_params.create!({name: "switch", param_type: "SWITCH"})
pred[:affects].predicate_params.create!({name: "lamp", param_type: "LAMP"})
pred[:group].predicate_params.create!({name: "g", param_type: nil})
pred[:in].predicate_params.create!({name: "l", param_type: "LAMP"})
pred[:in].predicate_params.create!({name: "g", param_type: "GROUP"})

problem = fp.create_problem name: 'default_problem'
