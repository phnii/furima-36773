class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_from
  belongs_to :shipping_fee
  belongs_to :shipping_days
  belongs_to :user
  has_one    :purchase
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :ship_from_id
      validates :shipping_days_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
