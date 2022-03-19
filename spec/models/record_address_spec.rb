require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      sleep(1)
      @item = FactoryBot.build(:item)
      sleep(1)
      @item.image = fixture_file_upload('public/image/a.png')
      sleep(1)
      @item.save
      sleep(1)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postial_codeが空だと保存できないこと' do
        @record_address.postial_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postial code can't be blank")
      end

      it 'postial_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postial_code = 'んああああ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postial code is invalid")
      end

      it 'place_idが空だと保存できないこと' do
        @record_address.place_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Place can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが短すぎると保存できないこと' do
        @record_address.phone_number = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it 'phone_numberが半角数字のみの正しい形式でないと保存できないこと' do
        @record_address.phone_number = '123あああ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end

    end
  end
end
