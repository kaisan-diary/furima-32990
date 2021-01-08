require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '正規の値があれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在すれば登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに＠がないと登録できない' do
          @user.email = 'iiiggg.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下だと登録できない' do
          @user.password = '33333'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordは半角英数字混合でないと登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordは全角のみでは登録できない' do
          @user.password = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordは数字のみでは登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'password_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '名字が空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it '名前が空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it '名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it '名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.family_name = 'kana'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name is invalid')
        end

        it 'フリガナ（名字）が空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'フリガナ（名前）が空だと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it '名字のフリガナは全角（カタカナ）でなければ登録できない' do
          @user.first_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end

        it '名前のフリガナは全角（カタカナ）でなければ登録できない' do
          @user.family_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana is invalid')
        end

        it 'birthdayが空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
