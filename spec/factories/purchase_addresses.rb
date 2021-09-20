FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567'}
    prefecture_id { 23}
    city {'名古屋市'}
    street_address {'千種区東1-1-1'}
    building_name {'千種アパート101'}
    phone_number { '08012121212'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
