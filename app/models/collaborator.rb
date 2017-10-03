class Collaborator < ApplicationRecord
  belongs_to :users
  belongs_to :wikis
end
