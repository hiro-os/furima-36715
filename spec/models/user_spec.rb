require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録が上手く行く時' do
      it "nameとemail、passwordとpassword_confiramation,family_name,last_name,family_name_katakana,last_name_katakana,yearが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の半角英数字混合であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "family_nameが全角文字であれば登録できる" do
        @user.family_name = "山田"
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "family_name_katakanaが全角カナであれば登録できる" do
        @user.family_name_katakana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_name_katakanaが全角カナであれば登録できる" do
        @user.last_name_katakana = "タロウ"
        expect(@user).to be_valid
      end
    end
    context '新規登録が上手くいかない時' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含まないと登録できない" do
        @user.email =  'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが129文字以上では登録できない" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "family_name_katakanaが空だと登録できない" do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end
      it "last_name_katakana空だと登録できない" do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "year空だと登録できない" do
        @user.year = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Year can't be blank")
      end
      it "family_nameが全角入力でなければ登録できない" do
        @user.family_name = '!!!!'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "last_nameが全角入力でなければ登録できない" do
        @user.last_name = '!!!!'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "family_name_katakanaが全角入力でなければ登録できない" do
        @user.family_name_katakana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana is invalid")
      end
      it "last_name_katakanaが全角入力でなければ登録できない" do
        @user.last_name_katakana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it "半角英数字混合なければ登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
