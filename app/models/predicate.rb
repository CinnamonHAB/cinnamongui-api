class Predicate < ApplicationRecord
  belongs_to :domain
  has_many :predicate_params

  enum predicate_type: {device: 'device', link: 'link', other: 'other'}
end
