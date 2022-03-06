class Record < ApplicationRecord

  #validates :user, presence: true, foreign_key: true
  #validates :item, presence: true, foreign_key: true

  belongs_to :item
  has_one :address
  belongs_to :user
end
