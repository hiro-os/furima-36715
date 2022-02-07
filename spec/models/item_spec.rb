require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品情報の保存" do
    context "商品情報が保存できない場合" do
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
      it "カテゴリーの情報idが整数でないと保存できない" do 
        @item.category_id ='a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態idが整数でないと保存できない" do 
        @item.situation_id ='a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "配送料の負担の情報idが整数でないと保存できない" do 
        @item.burdener_id ='a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burdener can't be blank")
      end
      it "発送元の地域の情報idが整数でないと保存できない" do 
        @item.area_id ='a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送までの日数の情報idが整数でないと保存できない" do 
        @item.order_day_id ='a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Order day can't be blank")
      end
      it "価格の情報が設定された価格内でないと保存できない" do 
        @item.price ='0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end