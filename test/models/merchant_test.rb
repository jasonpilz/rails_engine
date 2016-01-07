require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  should have_many(:items)
  should have_many(:invoices)

  test "merchant gets created with correct params" do
    merchant = Merchant.create!(name: "Best buy")

    assert "Best buy", merchant.name
  end
end
