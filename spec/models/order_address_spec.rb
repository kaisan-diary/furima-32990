require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end 

  describe '商品購入' do
    context '商品購入が上手くいくとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end  
    end
    context '商品購入がうまく行かない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code はハイフンを入れて正しく入力してください")
      end
      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @order_address.phone_number = '０９０４５６７８９７６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角数字で入力してください")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_address.phone_number = '090456787654'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'item_idが空だと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end
