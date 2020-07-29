require 'rails_helper'

RSpec.describe Customer, type: :model do # Customerモデルをテスト対象
  describe 'バリデーションエラーチェック' do
    before do
      @customer = build(:customer)
    end
    describe '名前（姓）が' do
      context "空欄の場合" do # データが正しく保存できることに関するテストを記述
        it "エラーメッセージが表示される" do
          @customer.name_sei = nil
          expect(@customer.errors.messages[:name_sei]).to include('を入力してください')
        end
      end
      context '全角８文字以内ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.name_sei = "１２３４５６７８９"
          expect(@customer.errors.messages[:name_sei]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '名前（名）が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.name_mei = nil
          expect(@customer.errors.messages[:name_mei]).to include('を入力してください')
        end
      end
      context '全角８文字以内ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.name_mei = "１２３４５６７８９"
          expect(@customer.errors.messages[:name_mei]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '名前（セイ）が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_sei = nil
          expect(@customer.errors.messages[:yomi_sei]).to include('を入力してください')
        end
      end
      context '全角８文字以内ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_sei = "１２３４５６７８９"
          expect(@customer.errors.messages[:yomi_sei]).to include('は8文字以内で入力してください')
        end
      end
      context 'カタカナ以外の場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_sei = "あいうえお"
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
      end
    end

    describe '名前（メイ）が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_mei = nil
          expect(@customer.errors.messages[:yomi_mei]).to include('を入力してください')
        end
      end
      context '全角８文字以内ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_mei = "１２３４５６７８９"
          expect(@customer.errors.messages[:yomi_mei]).to include('は8文字以内で入力してください')
        end
      end
      context 'カタカナ以外の場合' do
        it "エラーメッセージが表示される" do
          @customer.yomi_mei = "あいうえお"
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
      end
    end

    describe 'ニックネームが' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.nickname = nil
          expect(@customer.errors.messages[:nickname]).to include('を入力してください')
        end
      end
      context '全角２文字以上ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.nickname = "１"
          expect(@customer.errors.messages[:nickname]).to include('は2文字以上で入力してください')
        end
      end
      context '全角８文字以内ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.nickname = "１２３４５６７８９"
          expect(@customer.errors.messages[:nickname]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '郵便番号が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.postal_code = nil
          expect(@customer.errors.messages[:postal_code]).to include('を入力してください')
        end
      end
      context '半角数字ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.postal_code = "１２３４５６７８９"
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
      end
    end

    describe '都道府県が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.prefecture_code = nil
          expect(@customer.errors.messages[:prefecture_code]).to include('を入力してください')
        end
      end
    end

    describe '市区町村が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.address_city = nil
          expect(@customer.errors.messages[:address_city]).to include('を入力してください')
        end
      end
    end

    describe '町名番地が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.address_street = nil
          expect(@customer.errors.messages[:address_street]).to include('を入力してください')
        end
      end
    end

    describe '電話番号が' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.tell = nil
          expect(@customer.errors.messages[:tell]).to include('を入力してください')
        end
      end
      context '半角数字ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.tell = "１２３４５６７８９"
          expect(@customer.errors.messages[:tell]).to include('は半角数値で入力してください')
        end
      end
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.tell = nil
          expect(@customer.errors.messages[:tell]).to include('を入力してください')
        end
      end
      context '半角数字ではない場合' do
        it "エラーメッセージが表示される" do
          @customer.tell = "１２３４５６７８９"
          expect(@customer.errors.messages[:tell]).to include('は半角数値で入力してください')
        end
      end
    end

    describe 'メールアドレスが' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.email = nil
          expect(@customer.errors.messages[:email]).to include('を入力してください')
        end
      end
      context '@がない場合' do
        it "エラーメッセージが表示される" do
          @customer.email = "000000000000000"
          expect(@customer.errors.messages[:email]).to include('は不正な値です')
        end
      end
      context '重複した場合' do
        it "登録ができない" do
          customer = create(:customer)
          customer2 = build(:customer, email: "123456789@gmail.com")
          customer2.save
          expect(customer2.invalid?).to eq true
          expect(customer2.errors[:email]).to include("はすでに存在します")
        end
      end
    end

    describe 'パスワードのテスト' do
      context '空欄の場合' do
        it "エラーメッセージが表示される" do
          @customer.password = nil
          expect(@customer.errors.messages[:password]).to include('を入力してください')
        end
      end

      context '文字数のチェック' do
        it "5文字の場合登録できない" do
          @customer.password = "12345"
          expect(@customer.errors.messages[:password]).to include('は6文字以上で入力してください')
        end
        it "6文字の場合登録できる" do
        end
        it "12文字の場合登録できる" do
        end
        it "13文字の場合登録できない" do
          @customer.password = "1234567891234"
          expect(@customer.errors.messages[:password]).to include('は12文字以内で入力してください')
        end
      end
     
      context '半角英数字のチェック' do
        it '全て全角の場合登録できない' do
          @customer.password = "１２３４５６７８９"
          expect(@customer.errors.messages[:password]).to include('は半角英数字で入力して下さい')
        end

        it "全角が一文字でもある場合登録できない" do
          
        end

        it "全て半角の場合登録できる" do

        end
      end

      context '(確認用)がパスワードに一致しない場合' do
        it "エラーメッセージが表示される" do
          @customer.password = "１２３４５６７８９"
          @customer.password_confirmation = "１２３４５６７８"
          expect(@customer.errors.messages[:password_confirmation]).to include('とパスワードの入力が一致しません')
        end
      end
    end
  end
end