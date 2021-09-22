require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '新規購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフン(-)がないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号 を入力してください。ハイフンを含んでください')
      end
      it 'prefecture_idが空だと保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'prefecture_idが---だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市町村を入力してください")
      end
      it 'street_addressが空だと保存できない' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberにハイフンを含むと保存できない' do
        @purchase_address.phone_number = '080-1111-2222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁異常だと保存できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberに英数字以外が含まれている場合は保存できない' do
        @purchase_address.phone_number = '0801234123あ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空だと保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空では保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
