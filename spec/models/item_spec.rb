require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/a.png')
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'items_name,info,category_id,condition_id,shipping_price_id,place_id,day_tp_ship_id,priceが存在すれば出品できる' do
        @item.save
        
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it 'items_nameが空では出品できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'infoが空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_price_idが空では出品できない' do
        @item.shipping_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price can't be blank")
      end

      it 'place_idが空では出品できない' do
        @item.place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it 'day_tp_ship_idが空では出品できない' do
        @item.day_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
