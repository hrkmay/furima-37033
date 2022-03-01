class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
  end

  def create
    binding.pry
  end
end
