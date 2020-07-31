require 'rails_helper'

RSpec.describe Contact, type: :model do # Customerモデルをテスト対象
  let(:customer) { create(:customer) }
  describe 'バリデーションエラーテスト' do
    before do
      @contact = build(:contact)
    end
    describe '名前のテスト' do
      context "空欄のチェック" do # データが正しく保存できることに関するテストを記述
        it "空欄の場合登録できない" do
          @contact.contact_name = nil
          expect(@contact.valid?).to eq false # valid = エラーが発生した場合falseを返す/意味:@customerは無効であることを期待する
          expect(@contact.errors.messages[:contact_name]).to include('を入力してください')
        end
      end
      context '文字数のチェック(16文字以内で登録可)' do
        it "16文字の場合登録できる" do
          @contact.contact_name = "１２３４５６７８９０１２３４５６"
          expect(@contact).to be_valid #有効か確認
        end
        it "17文字の場合登録できない" do
          @contact.contact_name = "１２３４５６７８９０１２３４５６７"
          expect(@contact.valid?).to eq false
          expect(@contact.errors.messages[:contact_name]).to include('は16文字以内で入力してください')
        end
      end
    end

    describe 'メールアドレスのテスト' do
      context "空欄のチェック" do # データが正しく保存できることに関するテストを記述
        it "空欄の場合登録できない" do
          @contact.contact_email = nil
          expect(@contact.valid?).to eq false # valid = エラーが発生した場合falseを返す/意味:@customerは無効であることを期待する
          expect(@contact.errors.messages[:contact_email]).to include('を入力してください')
        end
      end
    end

    describe '問い合わせ内容のテスト' do
      context "空欄のチェック" do # データが正しく保存できることに関するテストを記述
        it "空欄の場合登録できない" do
          @contact.contact_content = nil
          expect(@contact.valid?).to eq false # valid = エラーが発生した場合falseを返す/意味:@customerは無効であることを期待する
          expect(@contact.errors.messages[:contact_content]).to include('を入力してください')
        end
      end
      context '文字数のチェック(300文字以内で登録可)' do
        it "300文字の場合登録できる" do
          @contact.contact_content = 'a' * 300
          expect(@contact).to be_valid #有効か確認
        end
        it "301文字の場合登録できない" do
          @contact.contact_content = 'a' * 301
          expect(@contact.valid?).to eq false
          expect(@contact.errors.messages[:contact_content]).to include('は300文字以内で入力してください')
        end
      end
    end
  end
end