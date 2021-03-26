FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name}
    item_detail         {Faker::Lorem.sentence}
    status_id           {2}
    category_id         {2}
    price               {1000}
    shipping_charge_id  {2}
    shipping_day_id     {2}
    prefecture_id       {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sunset-3392348.png'), filename: 'sunset-3392348.png')
    end
  end
end
