FactoryBot.define do
    factory :user do
      nickname              { 'test' }
      email                 { 'test@example.com' }
      password              { '000000' }
      password_confirmation { password }
      last_name_kanji       { '山田' }
      first_name_kanji      { '太郎' }
      last_name_kana        { 'ヤマダ' }
      first_name_kana       { 'タロウ' }
      birth_date            { Faker::Date.between(from: '1920-01-01', to: '2023-12-31') }
    end
  end