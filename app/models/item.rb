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
    validates :image
    validates :title
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: {
                        greater_than_or_equal_to: 300,
                        less_than: 10_000_000
                      }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_id
      validates :area_id
      validates :day_id
    end
  end
end
