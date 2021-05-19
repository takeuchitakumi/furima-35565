class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :day
  has_one_attached :image
  # has_one :history

  with_options presence: true do
    validates :title
    validates :description
    validates :price
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_id
      validates :area_id
      validates :date_id
    end
  end
end
