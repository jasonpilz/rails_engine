class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:merchant_id]).pending_customers
  end
end
