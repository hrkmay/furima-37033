FactoryBot.define do
  factory :item do
    items_name              {"犬"}
    info                    {"これは人面犬です"}
    category_id             {3}
    condition_id            {3}
    shipping_price_id       {3}
    place_id                {1}
    day_to_ship_id          {2}
    price                   {7777}
    
    association :user
  end
end
