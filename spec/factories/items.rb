FactoryBot.define do
  factory :item do
    name              { '釣竿' }
    explanation       { 'よく釣れる竿' }
    category_id       { 7 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    ship_from_id      { 2 }
    shipping_days_id  { 2 }
    price             { 5000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
