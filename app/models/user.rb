class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
         validates :email, uniqueness: true, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :encrypted_password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
         validates :first_name,         presence: true
         validates :last_name,          presence: true
         validates :first_kana_name,    presence: true
         validates :last_kana_name,     presence: true
         validates :birth,              presence: true
end
