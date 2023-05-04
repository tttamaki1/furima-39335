class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, :condition_id, :shipping_fee_bearer_id, :prefecture_id, :shipping_estimate_id, presence: true,
                                                                                                         numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_bearer
  belongs_to :prefecture
  belongs_to :shipping_estimate
end
