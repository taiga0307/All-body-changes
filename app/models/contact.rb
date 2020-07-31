class Contact < ApplicationRecord
  belongs_to :customer
  enum contact_status:{gym:0, product:1, other:2} # ジム・フィットネスについて、商品について、その他

  validates :contact_name, presence: true, length: { maximum:16 } # 文字数最大16文字
  validates :contact_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # メールアドレスフォーマット追加
  validates :contact_content, presence: true, length: { maximum:300 } # 文字数最大300文字
end