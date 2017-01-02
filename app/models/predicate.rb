class Predicate < ApplicationRecord
  belongs_to :domain
  has_many :predicate_params
end
