require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

  describe '新規投稿' do
    context '新規投稿ができる場合' do
      it '全ての項目が存在すればできる' do
        expect(@item).to be_valid
      end
      it '販売価格は半角数値かつ¥300~¥9,999,999の間である場合は保存できる' do
        @item.price = '1000'
        @item.valid?
        expect(@item).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'imageが空だと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと投稿できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'conceptが空だと投稿できない' do
        @item.concept = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'category_idが空だと投稿できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと投稿できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_payer_idが空だと投稿できない' do
        @item.postage_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'ship_area_idが空だと投稿できない' do
        @item.ship_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
      it 'ship_date_idが空だと投稿できない' do
        @item.ship_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end
      it 'priceは半角数値以外では投稿できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number.")
      end
      it 'priceは¥299以下では登録できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは¥10,000,000以上では登録できない' do
        @item.price = "10000001"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
