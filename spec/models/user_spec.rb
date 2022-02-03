require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(name: "", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "山田", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(name: "test", email: "", password: "00000000", password_confirmation: "00000000", family_name: "山田", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "passwordが空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "", password_confirmation: "00000000", family_name: "山田", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "password_confirmationが空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "", family_name: "山田", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_nameが空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "山田", last_name: "", family_name_katakana: "ヤマダ", last_name_katakana: "タロウ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_name_katakanaが空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "山田", last_name: "太郎", family_name_katakana: "", last_name_katakana: "タロウ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "last_name_katakana空だと登録できない" do
      user = User.new(name: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "山田", last_name: "太郎", family_name_katakana: "ヤマダ", last_name_katakana: "")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
   end
 end
