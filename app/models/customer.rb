class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :post_code, presence: true, format: {with: /\A\d{7}\z/, message: "ハイフンなしの７桁で入力して下さい"}
  
  

  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約をかける
  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
end
