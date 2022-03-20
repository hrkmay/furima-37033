class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_record, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
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

  def set_record
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_address).permit(:building_name, :postial_code, :place_id, :city, :house_number, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || !@item.record.nil?
  end
end
