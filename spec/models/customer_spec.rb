require 'rails_helper'

RSpec.describe Customer, type: :model do # Customerモデルをテスト対象
  context "customerバリデーションテスト" do # データが正しく保存できることに関するテストを記述
    it "名前（姓）が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.name_sei = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_sei]).to include('を入力してください')
    end
    it "名前（姓）が全角８文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.name_sei = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_sei]).to include('は8文字以内で入力してください')
    end

    it "名前（名）が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.name_mei = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_mei]).to include('を入力してください')
    end
    it "名前（名）が全角８文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.name_mei = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:name_mei]).to include('は8文字以内で入力してください')
    end

    it "名前（セイ）が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_sei = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_sei]).to include('を入力してください')
    end
    it "名前（セイ）が全角８文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_sei = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_sei]).to include('は8文字以内で入力してください')
    end
    it "名前（セイ）がカタカナ以外の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_sei = "あいうえお"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
    end

    it "名前（メイ）が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_mei = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_mei]).to include('を入力してください')
    end
    it "名前（メイ）が全角８文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_mei = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_mei]).to include('は8文字以内で入力してください')
    end
    it "名前（メイ）がカタカナ以外の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.yomi_mei = "あいうえお"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
    end

    it "ニックネームが空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.nickname = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:nickname]).to include('を入力してください')
    end
    it "ニックネームが全角２文字以上ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.nickname = "１"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:nickname]).to include('は2文字以上で入力してください')
    end
    it "ニックネームが全角８文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.nickname = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:nickname]).to include('は8文字以内で入力してください')
    end

    it "郵便番号が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.postal_code = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:postal_code]).to include('を入力してください')
    end
    it "郵便番号が半角数字ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.postal_code = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
    end

    it "都道府県が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.prefecture_code = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:prefecture_code]).to include('を入力してください')
    end

    it "市区町村が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.address_city = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:address_city]).to include('を入力してください')
    end

    it "町名番地が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.address_street = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:address_street]).to include('を入力してください')
    end

    it "電話番号が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.tell = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:tell]).to include('を入力してください')
    end
    it "電話番号が半角数字ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.tell = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:tell]).to include('は半角数値で入力してください')
    end

    it "電話番号が空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.tell = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:tell]).to include('を入力してください')
    end
    it "電話番号が半角数字ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.tell = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:tell]).to include('は半角数値で入力してください')
    end

    it "メールアドレスが空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.email = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:email]).to include('を入力してください')
    end
    it "メールアドレスが@がない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.email = "000000000000000"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:email]).to include('は不正な値です')
    end
    # it "メールアドレスが重複した場合エラーメッセージが表示される" do
    #   customer = Customer.new
    #   duplicate_customer = @customer.dup
    #   duplicate_customer.save
    #   assert_not duplicate_customer.valid?
    #   expect(customer.errors[:email]).to include("既に登録されてます")
    # end

    it "パスワードが空欄の場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.password = nil
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:password]).to include('を入力してください')
    end
    it "パスワードが６文字以上ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.password = "12345"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:password]).to include('は6文字以上で入力してください')
    end
    it "パスワードが１２文字以内ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.password = "1234567891234"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:password]).to include('は12文字以内で入力してください')
    end
    it "パスワードが半角英数字ではない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.password = "１２３４５６７８９"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:password]).to include('は半角英数字で入力して下さい')
    end

    it "パスワード(確認用)がパスワードに一致しない場合エラーメッセージが表示される" do
      customer = Customer.new
      customer.password = "１２３４５６７８９"
      customer.password_confirmation = "１２３４５６７８"
      customer.valid? # バリデーションをかけている
      expect(customer.errors.messages[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
  end
end