class Address < ApplicationRecord
  #validates :postial_code,         presence: true
  #validates :place_id,             presence: true
  #validates :city,                 presence: true
  #validates :house_number,         presence: true
  #validates :building_name
  #validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }, format: {with: /\A[0-9]+\z/ }
  

  belongs_to :record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :place
end
