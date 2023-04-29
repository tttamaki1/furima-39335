FactoryBot.define do
    factory :item do
    #   image                 { 'aaa.jpg' }
      item_name             { 'スターシップ' }
      description           { '宇宙船' }
      price                 { 3000 }
      condition_id          { 1 }
      category_id           { 1 }
      shipping_fee_bearer_id   { 1 }
      prefecture_id            { 1 }
      shipping_estimate_id     { 1 }
      association :user
      after(:build) do |item|
        item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpeg')
      end
    end
  end
