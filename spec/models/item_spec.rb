require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "ツイートの保存" do
    context "ツイートが保存できない場合" do
      it "タイトルがないとツイートは保存できない" do
        @item.title =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "説明文がないとツイートは保存できない" do
        @item.version =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Version can't be blank")
      end
    end
  end
end