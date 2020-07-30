class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name_sei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :name_mei, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :yomi_sei, presence: true, length: { maximum:8 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'} # 文字数最大8文字,カタカナのみ
  validates :yomi_mei, presence: true, length: { maximum:8 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'} # 文字数最大8文字,カタカナのみ
  validates :nickname, presence: true, length: { minimum:2, maximum:8 } # 文字数最小2文字、最大8文字
  validates :postal_code, presence: true, numericality: { only_integer: true }, format: { with: /\A\d{7}\z/, message: 'は7桁で入力して下さい'} # 半角数字のみ、7桁のみ許可
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: { minimum:2, maximum:6 } # 文字数最小2文字、最大6文字
  validates :address_street, presence: true
  validates :tell, presence: true, numericality: { only_integer: true }, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁で入力して下さい' } # 半角数字のみ、10桁または11桁のみ許可
  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角英数字で入力して下さい'} # 半角英数字のみ許可

  mount_uploader :customer_picture_id, ImageUploader #activeadminにてアップロードするため記述

  has_many :contacts
  has_many :gym_favorites, through: :gym_favorites, source: :gym # has many throughを使えば、カスタマーがいいねした施設を直接アソシエーションで取得が可能。sourceは「参照元のモデル」をさすオプション。
  has_many :gym_favorites, dependent: :destroy #ジムいいねが削除された際にジムいいねテーブルのユーザー情報も削除
  has_many :gym_comments, dependent: :destroy #ジムコメントが削除された際にジムコメントテーブルのユーザー情報も削除

  has_many :reservations

  has_many :product_favorites, through: :product_favorites, source: :product # has many throughを使えば、カスタマーがいいねした商品を直接アソシエーションで取得が可能。sourceは「参照元のモデル」をさすオプション。
  has_many :product_favorites, dependent: :destroy #商品いいねが削除された際に商品いいねテーブルのユーザー情報も削除
  has_many :product_comments, dependent: :destroy #商品コメントが削除された際に商品コメントテーブルのユーザー情報も削除

  # 住所自動入力の為下記記述
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
