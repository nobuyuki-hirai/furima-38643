require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字混合であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

      context 'ユーザー登録できない場合' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@がないと登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordは5文字以下だと登録できない' do
          @user.password = '1234'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '1234a'
          @user.password_confirmation = 'abcd1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが空だと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameは全角でないと登録できない' do
          @user.last_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_nameは全角でないと登録できない' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it 'last_name_kanaが空だと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_name_kanaは全角(カタカナ)でないと登録できない' do
          @user.last_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid')
        end
        it 'first_name_kanaは全角(カタカナ)でないと登録できない' do
          @user.first_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end
        it '生年月日が空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
