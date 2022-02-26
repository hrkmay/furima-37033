class RecordAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :place_id, :city, :house_number, :building_name, :phone_number, :record
  
end