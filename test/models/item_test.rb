require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:merchant)
  should have_many(:invoice_items)

  test "item gets created with correct attributes" do
    merchant = Merchant.last
    item = Item.create!(name: "Buggatti",
                        description: "My car",
                        unit_price: 456343424,
                        merchant_id: merchant.id)

    assert_equal "Buggatti", item.name
    assert_equal "My car", item.description
    assert_equal 4563434.24, item.unit_price
    assert_equal merchant.id, item.merchant_id
  end
end
