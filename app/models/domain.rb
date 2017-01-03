class Domain < ApplicationRecord
  has_many :floorplans
  has_many :predicates

  has_many :problems, through: :floorplans
end
