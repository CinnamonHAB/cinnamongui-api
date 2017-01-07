class DeviceDefinition < ApplicationRecord
  belongs_to :problem
  belongs_to :predicate
  has_one :floorplan_object, dependent: :destroy
end
