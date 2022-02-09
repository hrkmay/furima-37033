class Item < ApplicationRecord
  validates :title, :text, presence: true
  

  belongs_to :user
  has_one :record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  

   

end
