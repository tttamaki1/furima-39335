class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_bearer_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_estimate_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_bearer
  belongs_to :prefecture
  belongs_to :shipping_estimate  

end
