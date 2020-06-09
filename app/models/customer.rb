class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name_sei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :name_mei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :yomi_sei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :yomi_mei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :nickname, presence: true, length: { minimum:2, maximum:8 } # 文字数最小2文字、最大8文字
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } # 郵便番号の形式のみ許可(◯◯◯-◯◯◯◯)
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :tell, presence: true, numericality: { only_integer: true } # 数字のみ許可




  has_many :contacts
  has_many :product_comments, dependent: :destroy #商品コメントが削除された際に商品コメントテーブルのユーザー情報も削除
  has_many :product_favorites, dependent: :destroy #商品いいねが削除された際に商品いいねテーブルのユーザー情報も削除
  has_many :gym_comments, dependent: :destroy #ジムコメントが削除された際にジムコメントテーブルのユーザー情報も削除
  has_many :gym_favorites, dependent: :destroy #ジムいいねが削除された際にジムいいねテーブルのユーザー情報も削除
  has_many :reservations


end
