FactoryBot.define do
  factory :user do
    nickname                { 'test' }
    email                   { 'test@test' }
    password                { 'abc123' }
    password_confirmation   { password }
    first_name              { '山田' }
    last_name               { '太郎' }
    first_name_kana         { 'ヤマダ' }
    last_name_kana          { 'タロウ' }
    birthday                { '1999-12-10' }
  end
end
