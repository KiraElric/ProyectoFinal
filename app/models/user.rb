class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_collections
  has_many :appraisals
  
  validates :name, :lastname, presence: true

  def fullname
    "#{name} #{lastname}"
  end
end
