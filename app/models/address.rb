class Address < ApplicationRecord
  validates :image,                presence: true
  validates :items_name,           presence: true
  validates :info,                 presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :shipping_price_id,    presence: true
  validates :place_id,             presence: true
end
