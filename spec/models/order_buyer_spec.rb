require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe ' 購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end
      it 'build_nameは空でも保存できること' do
        @order_buyer.build_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.post_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_buyer.prefecture = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが10桁未満では保存できないこと' do
        @order_buyer.phone_number = '123456789'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_buyer.phone_number = '123456789000'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'phone_numberに半角数字以外が含まれている場合は保存できない' do
        @order_buyer.phone_number = '０８０９７８６１９２８'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
