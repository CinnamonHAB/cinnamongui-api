class Floorplan < ApplicationRecord
  belongs_to :domain
  has_one :problem
end
