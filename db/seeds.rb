Domain.create!([
  {name: "default_domain", floorplan_id: 1}
])
Floorplan.create!([
  {}
])
FloorplanObject.create!([
  {angle: 0.0, background_color: nil, fill: "blue", height: 50.0, width: 50.0, left: 200.0, top: 200.0, opacity: 1.0, scale_x: nil, scale_y: nil, type: nil},
  {angle: 0.0, background_color: nil, fill: "blue", height: 80.0, width: 80.0, left: 300.0, top: 300.0, opacity: 1.0, scale_x: 2, scale_y: 2, type: nil}
])
Predicate.create!([
  {keyword: "LAMP", domain_id: 1},
  {keyword: "SWITCH", domain_id: 1},
  {keyword: "AFFECTS", domain_id: 1},
  {keyword: "GROUP", domain_id: 1},
  {keyword: "IN", domain_id: 1}
])
PredicateParam.create!([
  {name: "l", param_type: nil, predicate_id: 1},
  {name: "s", param_type: nil, predicate_id: 2},
  {name: "switch", param_type: "SWITCH", predicate_id: 3},
  {name: "LAMP", param_type: "LAMP", predicate_id: 3},
  {name: "g", param_type: nil, predicate_id: 5},
  {name: "l", param_type: "LAMP", predicate_id: 6},
  {name: "g", param_type: "GROUP", predicate_id: 6}
])
