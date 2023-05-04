FactoryBot.define do
  factory :order_form do
    postal_code           { '123-4567' }
    prefecture_id         { 2 }
    city                  { '千葉市' }
    street_address        { '中央区 1-1-1' }
    building_name         { 'ABC Building 101' }
    phone_number          { '09012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
  
end
