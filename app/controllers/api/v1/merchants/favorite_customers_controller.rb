class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:merchant_id]).favorite_customer
  end
end
