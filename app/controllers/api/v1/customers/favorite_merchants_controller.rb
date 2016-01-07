class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find(params[:customer_id]).favorite_merchant
  end
end
