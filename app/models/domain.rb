class Domain < ApplicationRecord
  has_many :floorplans
  has_many :predicates
end
