class LinkDefinitionParam < ApplicationRecord
  belongs_to :link_definition, dependent: :destroy
  belongs_to :predicate_param
  belongs_to :device_definition
end
