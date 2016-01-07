class Api::V1::Items::MostRevenuesController < ApplicationController
  respond_to :json

  def show
    respond_with Item.most_revenue_items(params["quantity"])
  end
end
