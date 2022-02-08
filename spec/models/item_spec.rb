require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品情報の保存" do
    context "商品情報が保存できる場合" do
      it "画像が存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "商品名が存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "商品の説明が存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "カテゴリーの情報が---以外だと保存できる" do
        expect(@item).to be_valid
      end
      it "商品の状態が---以外だと保存できる" do 
        expect(@item).to be_valid
      end
      it "配送料の負担の情報が---以外だと保存できる" do 
        expect(@item).to be_valid
      end
      it "発送元の地域の情報が---以外だと保存できる" do 
        expect(@item).to be_valid
      end
      it "発送までの日数の情報が---以外だと保存できる" do 
        expect(@item).to be_valid
      end
      it "価格の情報が存在すれば保存できる" do 
        expect(@item).to be_valid
      end
      it "価格の情報が半角数字だと保存できる" do 
        @item.price ='400'
        expect(@item).to be_valid
      end
      it "価格の情報が300以上だと保存できる" do 
        expect(@item).to be_valid
      end
      it "価格の情報が9999999未満だと保存できる" do 
        expect(@item).to be_valid
      end
    end
  end

  describe "商品情報の保存" do
    context "商品情報が保存できない場合" do
      it "画像が空白だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと保存できない" do
        @item.title =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明がないと保存できない" do
        @item.version =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Version can't be blank")
      end
      it "カテゴリーの情報が---だと保存できない" do 
        @item.category_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が---だと保存できない" do 
        @item.situation_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "配送料の負担の情報が---だと保存できない" do 
        @item.burdener_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burdener can't be blank")
      end
      it "発送元の地域の情報が---だと保存できない" do 
        @item.area_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送までの日数の情報が---だと保存できない" do 
        @item.order_day_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Order day can't be blank")
      end
      it "価格の情報が空白だと保存できない" do 
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の情報が半角数字以外だと保存できない" do 
        @item.price ='４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の情報が300未満だと保存できない" do 
        @item.price ='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の情報が9999999以上だと保存できない" do 
        @item.price ='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end