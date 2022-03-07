class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if 
      @record_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:hoge, :building_name, :postial_code, :place_id, :city, :house_number, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
