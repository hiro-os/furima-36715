class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :year, presence: true
#  has_many :items
#  has_many :orders  
end
