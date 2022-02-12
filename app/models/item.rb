class Item < ApplicationRecord
  
  validates :image,                presence: true
  validates :items_name,           presence: true
  validates :info,                 presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :shipping_price_id,    presence: true
  validates :place_id,             presence: true
  validates :day_to_ship_id,       presence: true
  validates :price, numericality: { in: 300..9999999 }, presence: true


  belongs_to :user
  has_one :record
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_price
  belongs_to_active_hash :place
  belongs_to_active_hash :day_to_ship
end
