class Contact < ApplicationRecord
  belongs_to :customer
  enum contact_status:{gym:0, product:1, other:2} # ジム・フィットネスについて、商品について、その他

  validates :contact_name, presence: true, length: { maximum:8 } # 文字数最大8文字
  validates :contact_email, presence: true
  validates :contact_content, presence: true, length: { maximum:300 } # 文字数最大300文字
end