class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborator
end
