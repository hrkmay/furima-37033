class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:  Item.find(params[:item_id]).price,
        card: record_params[:token],
        currency: 'jpy'
      )
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    params.require(:record_address).permit(:token, :hoge, :building_name, :postial_code, :place_id, :city, :house_number, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

end
