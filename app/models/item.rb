class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_from
  belongs_to :shipping_fee
  belongs_to :shipping_days
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :user
    with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :ship_from_id
      validates :shipping_days_id
    end
    validates :price
  end
end
