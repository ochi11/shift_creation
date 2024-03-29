class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :hope_shifts, dependent: :destroy
  
    
  validates :name, presence: true
  validates :email, presence: true
  #validates :password, presence: true
end