class User < ApplicationRecord
  validates :nickname,            presence: true
  validates :last_name_kanji,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kanji,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_katakana,  presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_katakana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday,            presence: true
  validates :password,            format: { with: /\A[a-z0-9]+\z/i }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :histories
end
