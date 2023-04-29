FactoryBot.define do
    factory :item do
      image                 { 'aaa.jpg' }
      item_name             { 'スターシップ' }
      description           { '宇宙船' }
      price                 { '3000' }
      condition_id          { '1' }
      category_id           { '1' }
      shipping_fee_bearer_id   { '1' }
      prefecture_id            { '1' }
      shipping_estimate_id     { '1' }
    end
  end
