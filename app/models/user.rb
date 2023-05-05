class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z0-9]+\z/i, allow_blank: true }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true

  has_many :items
  has_many :purchase_histories
end
