class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥ー]+\z/}
  validates :family_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :year, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  has_many :items
  has_many :orders  
end
