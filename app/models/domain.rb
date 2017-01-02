class Domain < ApplicationRecord
  belongs_to :floorplan
  has_many :predicates
end
