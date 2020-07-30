require 'rails_helper'

RSpec.describe Customer, type: :model do # Customerモデルをテスト対象
  describe 'バリデーションエラーテスト' do
    before do
      @customer = build(:customer)
    end
    describe '名前（姓）のテスト' do
      context "空欄のチェック" do # データが正しく保存できることに関するテストを記述
        it "空欄の場合登録できない" do
          @customer.name_sei = nil
          expect(@customer.valid?).to eq false # valid = エラーが発生した場合falseを返す/意味:@customerは無効であることを期待する
          expect(@customer.errors.messages[:name_sei]).to include('を入力してください')
        end
      end
      context '文字数のチェック(8文字以内で登録可)' do
        it "8文字の場合登録できる" do
          @customer.name_sei = "１２３４５６７８"
          expect(@customer).to be_valid #有効か確認
        end
        it "9文字の場合登録できない" do
          @customer.name_sei = "１２３４５６７８９"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:name_sei]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '名前（名）のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.name_mei = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:name_mei]).to include('を入力してください')
        end
      end
      context '文字数のチェック(8文字以内で登録可)' do
        it "8文字の場合登録できる" do
          @customer.name_mei = "１２３４５６７８"
          expect(@customer).to be_valid #有効か確認
        end
        it "9文字の場合登録できない" do
          @customer.name_mei = "１２３４５６７８９"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:name_mei]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '名前（セイ）のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.yomi_sei = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('を入力してください')
        end
      end
      context '文字数のチェック(8文字以内で登録可)' do
        it "8文字の場合登録できる" do
          @customer.yomi_sei = "アイウエオカキク"
          expect(@customer).to be_valid #有効か確認
        end
        it "9文字の場合登録できない" do
          @customer.yomi_sei = "アイウエオカキクケ"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('は8文字以内で入力してください')
        end
      end
      context '文字表記のチェック' do
        it "全角カタカナの場合登録できる" do
          @customer.yomi_sei = "アイウエオ"
          expect(@customer).to be_valid #有効か確認
        end
        it "半角カタカナの場合登録できる" do
          @customer.yomi_sei = "ｱｲｳｴｵ"
          expect(@customer).to be_valid #有効か確認
        end
        it "平仮名の場合登録できない" do
          @customer.yomi_sei = "あいうえお"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
        it "半角英字の場合登録できない" do
          @customer.yomi_sei = "ABCDE"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
        it "全角英字の場合登録できない" do
          @customer.yomi_sei = "ＡＢＣＤＥ"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
        it "半角数字の場合登録できない" do
          @customer.yomi_sei = "12345"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
        it "全角数字の場合登録できない" do
          @customer.yomi_sei = "１２３４５"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
        it "記号(ピリオド)の場合登録できない" do
          @customer.yomi_sei = "....."
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_sei]).to include('はカタカナで入力して下さい')
        end
      end
    end

    describe '名前（メイ）のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.yomi_mei = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('を入力してください')
        end
      end
      context '文字数のチェック(8文字以内で登録可)' do
        it "8文字の場合登録できる" do
          @customer.yomi_mei = "アイウエオカキク"
          expect(@customer).to be_valid #有効か確認
        end
        it "9文字の場合登録できない" do
          @customer.yomi_mei = "アイウエオカキクケ"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('は8文字以内で入力してください')
        end
      end
      context '文字表記のチェック' do
        it "全角カタカナの場合登録できる" do
          @customer.yomi_mei = "アイウエオ"
          expect(@customer).to be_valid #有効か確認
        end
        it "半角カタカナの場合登録できる" do
          @customer.yomi_mei = "ｱｲｳｴｵ"
          expect(@customer).to be_valid #有効か確認
        end
        it "平仮名の場合登録できない" do
          @customer.yomi_mei = "あいうえお"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
        it "半角英字の場合登録できない" do
          @customer.yomi_mei = "ABCDE"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
        it "全角英字の場合登録できない" do
          @customer.yomi_mei = "ＡＢＣＤＥ"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
        it "半角数字の場合登録できない" do
          @customer.yomi_mei = "12345"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
        it "全角数字の場合登録できない" do
          @customer.yomi_mei = "１２３４５"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
        it "記号(ピリオド)の場合登録できない" do
          @customer.yomi_mei = "....."
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:yomi_mei]).to include('はカタカナで入力して下さい')
        end
      end
    end

    describe 'ニックネームのテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.nickname = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:nickname]).to include('を入力してください')
        end
      end
      context '文字数のチェック(2文字以上8文字以内で登録可)' do
        it "2文字の場合登録できる" do
          @customer.nickname = "１２"
          expect(@customer).to be_valid #有効か確認
        end
        it "8文字の場合登録できる" do
          @customer.nickname = "１２３４５６７８"
          expect(@customer).to be_valid #有効か確認
        end
        it "1文字の場合登録できない" do
          @customer.nickname = "１"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:nickname]).to include('は2文字以上で入力してください')
        end
        it "9文字の場合登録できない" do
          @customer.nickname = "１２３４５６７８９"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:nickname]).to include('は8文字以内で入力してください')
        end
      end
    end

    describe '郵便番号のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.postal_code = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('を入力してください')
        end
      end
      context '文字数のチェック(7文字のみ登録可)' do
        it "半角数字の場合登録できる" do
          @customer.postal_code = "1234567"
          expect(@customer).to be_valid #有効か確認
        end
        it "8文字の場合登録できない" do
          @customer.postal_code = "12345678"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は7桁で入力して下さい')
        end
        it "6文字の場合登録できない" do
          @customer.postal_code = "123456"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は7桁で入力して下さい')
        end
      end
      context '文字表記のチェック' do
        it "半角数字の場合登録できる" do
          @customer.postal_code = "1234567"
          expect(@customer).to be_valid #有効か確認
        end
        it "全角数字の場合登録できない" do
          @customer.postal_code = "１２３４５６７"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
        it "平仮名の場合登録できない" do
          @customer.postal_code = "あいうえおかき"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
        it "半角英字の場合登録できない" do
          @customer.postal_code = "ABCDEFG"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
        it "全角英字の場合登録できない" do
          @customer.postal_code = "ＡＢＣＤＥＦＧ"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
        it "記号(ピリオド)の場合登録できない" do
          @customer.postal_code = "......."
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:postal_code]).to include('は半角数値で入力してください')
        end
      end
    end

    describe '都道府県のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.prefecture_code = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:prefecture_code]).to include('を入力してください')
        end
      end
    end

    describe '市区町村のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.address_city = nil
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:address_city]).to include('を入力してください')
        end
      end
      context '文字数のチェック(2文字以上6文字以内で登録可)' do
        it "2文字の場合登録できる" do
          @customer.address_city = "１２"
          expect(@customer).to be_valid #有効か確認
        end
        it "6文字の場合登録できる" do
          @customer.address_city = "１２３４５６"
          expect(@customer).to be_valid #有効か確認
        end
        it "1文字の場合登録できない" do
          @customer.address_city = "１"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:address_city]).to include('は2文字以上で入力してください')
        end
        it "7文字の場合登録できない" do
          @customer.address_city = "１２３４５６７"
          expect(@customer.valid?).to eq false
          expect(@customer.errors.messages[:address_city]).to include('は6文字以内で入力してください')
        end
      end
    end

    describe '町名番地のテスト' do
      context '空欄のチェック' do
        it "空欄の場合登録できない" do
          @customer.address_street = nil
          expect(@customer.valid?).to eq false
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