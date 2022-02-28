class RecordAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :place_id, :city, :house_number, :building_name, :phone_number, :record

  with_options presence: true do
   validates :postial_code
   validates :place_id
   validates :city
   validates :house_number
   validates :phone_number, length: { minimum: 10, maximum: 11 }, format: {with: /\A[0-9]+\z/ }
   validates :user, foreign_key: true
   validates :item, foreign_key: true
  end
   validates :building_name

   def save
    record = Record.create(user: user, item: item)
    address = Address.create(postial_code: postial_code, place_id: place_id, city: city, house_number: house_number, 
                             phone_number: phone_number, building_name: building_name)
   end
end