class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with Merchant.revenue_by_date(params[:date], params[:merchant_id])
    else
      respond_with Merchant.revenue(params[:merchant_id])
    end
  end
end
