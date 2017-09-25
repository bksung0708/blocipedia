class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis

  after_initialize :init

  def init
    self.role ||= :standard
  end
  
  enum role: [:standard, :premium, :admin]

end
