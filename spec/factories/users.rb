FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    first_name            { "恵" }
    last_name             {"中村"}
    first_kana_name       {"ケイ"}
    last_kana_name        {"ナカムラ"}
    birth                 {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
    password_confirmation {password}
  end
end