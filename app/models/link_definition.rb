class LinkDefinition < ApplicationRecord
  belongs_to :problem
  belongs_to :predicate
  has_many :link_definition_params
end
