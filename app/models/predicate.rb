class Predicate < ApplicationRecord
  belongs_to :domain
  has_many :predicate_params, ->{ order(id: :asc) }
  has_many :link_definitions

  enum predicate_type: {device: 'device', link: 'link', other: 'other'}

end
