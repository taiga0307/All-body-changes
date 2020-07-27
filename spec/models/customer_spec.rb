require 'rails_helper'

RSpec.describe Customer, type: :model do # Customerモデルをテスト対象
  context "データが正しく保存される" do # データが正しく保存できることに関するテストを記述

    it "名前（姓）に全角９文字入っていたらエラーメッセージが表示される" do
      customer = Customer.new
      customer.name_sei = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_sei]).to include('は8文字以内で入力してください')
    end
    it "名前（姓）が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_sei]).to include('を入力してください')
    end

    # it "全て入力してあるので保存される" do # 正しくデータが保存されているか確認
    #   customer = Customer.new
    #   customer.name_sei = "森田"
    #   customer.name_mei = "太一"
    #   customer.yomi_sei = "モリタ"
    #   customer.yomi_mei = "タイチ"
    #   customer.nickname = "たいたい"
    #   customer.postal_code = "2733322"
    #   customer.prefecture_code = "千葉県"
    #   customer.address_city = "習志野市"
    #   customer.address_street = "津田沼"
    #   customer.tell = "09090909090909"
    #   customer.email = "4tai03.ga07@gmail.com"
    #   customer.password = "TAIGA03ga07"
    #   customer.password_confirmation = "TAIGA03ga07"
    #   customer.save
    #   expect(customer).to be_valid
    # end
    # it "名前が空欄だと登録できない" do
    # end
  end
end





  # validates :name_sei, presence: true, length: { maximum:8 } # 文字数最大8文字
  # validates :name_mei, presence: true, length: { maximum:8 } # 文字数最大8文字
  # validates :yomi_sei, presence: true, length: { maximum:8 } # 文字数最大8文字
  # validates :yomi_mei, presence: true, length: { maximum:8 } # 文字数最大8文字
  # validates :nickname, presence: true, length: { minimum:2, maximum:8 } # 文字数最小2文字、最大8文字
  # validates :postal_code, presence: true, numericality: { only_integer: true } # 数字のみ許可
  # validates :prefecture_code, presence: true
  # validates :address_city, presence: true
  # validates :address_street, presence: true
  # validates :tell, presence: true, numericality: { only_integer: true } # 数字のみ許可