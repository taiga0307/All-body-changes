class GymComment < ApplicationRecord
  belongs_to :customer
  belongs_to :gym

  validates :gym_rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true  # ５より小さく１より大きい＋空白
  validates :gym_title, presence: true
end
