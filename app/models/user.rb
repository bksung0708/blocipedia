class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis
  has_many :collaborators

  after_initialize :init

  def init
    self.role ||= :standard
  end

  def collaborator_for(wiki)
    collaborators.where(wiki_id: wiki.id).first
  end

  enum role: [:standard, :premium, :admin]

end
