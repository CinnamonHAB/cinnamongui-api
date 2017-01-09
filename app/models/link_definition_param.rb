class LinkDefinitionParam < ApplicationRecord
  belongs_to :link_definition
  belongs_to :predicate_param
  belongs_to :device_definition
end
