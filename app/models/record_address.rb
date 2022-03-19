class RecordAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postial_code, :place_id, :city, :house_number, :building_name, :phone_number, :record, :hoge

  with_options presence: true do
   validates :postial_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
   validates :place_id
   validates :city
   validates :house_number
   validates :phone_number, length: { minimum: 10, maximum: 11 }, format: {with: /\A[0-9]+\z/ }
   validates :user_id
   validates :item_id
   validates :token
  end

   validate :building_name

   def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postial_code: postial_code, place_id: place_id, city: city, house_number: house_number, 
                             phone_number: phone_number, building_name: building_name, record_id: record.id)
   end
end

