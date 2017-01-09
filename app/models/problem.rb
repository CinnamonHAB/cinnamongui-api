class Problem < ApplicationRecord
  belongs_to :floorplan
  has_one :domain, through: :floorplan
  
  has_many :device_definitions
  has_many :link_definitions
end
