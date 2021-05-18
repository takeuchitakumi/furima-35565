class User < ApplicationRecord
  with_options presence: true do
    validates :nickname            
    validates :last_name_kanji,     format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_kanji,    format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name_katakana,  format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :first_name_katakana, format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :birthday
    validates :password,            format: { with: /\A[a-z0-9]+\z/i }
  end
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    has_many :items
    has_many :histories
end
