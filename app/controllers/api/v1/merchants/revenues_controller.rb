class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  # returns the total revenue for that merchant across all transactions (not couting failed charges)
  def show
    # respond_with Merchant.find(params["merchant_id"]).invoices.joins(:transactions).where(transactions: {status: "success"})
    respond_with Merchant.find(params["merchant_id"]).transactions.where(transactions: {result: "success"})
  end
end
