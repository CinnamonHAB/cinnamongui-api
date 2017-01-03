class DeviceDefinition < ApplicationRecord
  belongs_to :problem
  belongs_to :predicate
end
