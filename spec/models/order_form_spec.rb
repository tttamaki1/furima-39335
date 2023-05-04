require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it '存在すべき属性があれば購入ができる' do
      expect(@order_form).to be_valid
    end
    it 'building_nameが空でも購入ができる' do
      @order_form.building_name = ''
      expect(@order_form).to be_valid
    end
  end
  context '内容に問題がある場合' do
    it 'tokenが空では購入できない' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では購入できない' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンが含まれていない場合購入できない' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが未選択の場合購入できない' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では購入できない' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'street_addressが空では購入できない' do
      @order_form.street_address = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street address can't be blank")
    end

    it 'phone_numberが空では購入できない' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンが含まれている場合購入できない' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが9桁以下では購入できない' do
      @order_form.phone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが12桁以上では購入できない' do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが全角数字を含む場合は登録できない' do
      @order_form.phone_number = '０９０００００００００'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが数字以外を含む場合は登録できない' do
      @order_form.phone_number = '電話番号'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'user_idが紐付いていなければ投稿できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが紐付いていなければ投稿できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
