class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :last_name_kanji
      validates :first_name_kanji
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
    validates :birthday
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :histories
end
