FloorplanObject.create!([
  {angle: 0.0, background_color: nil, fill: "blue", height: 50.0, width: 50.0, left: 200.0, top: 200.0, opacity: 1.0, scale_x: nil, scale_y: nil, type: nil},
  {angle: 0.0, background_color: nil, fill: "blue", height: 80.0, width: 80.0, left: 300.0, top: 300.0, opacity: 1.0, scale_x: 2, scale_y: 2, type: nil}
])

domain = Domain.create!({name: "default_domain"})

domain.floorplans.create!

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
