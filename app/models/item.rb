class Item < ApplicationRecord
  validates :title, :text, presence: true
  

  belongs_to :user
  has_one :record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_price
  belongs_to_active_hash :place
  belongs_to_active_hash :day_to_ship
end
