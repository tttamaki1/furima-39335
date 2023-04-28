class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true       
end
