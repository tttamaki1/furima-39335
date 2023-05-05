class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'をハイフンを含めて入力してください。' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は数字のみ入力してください', allow_blank: true }
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address,
                           building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end

  def self.human_attribute_name(attr, options = {})
    I18n.t("models.order_form.#{attr}", default: super)
  end
end
