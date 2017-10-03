class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :collaborator_users, through: :collaborators, source: :user
end
