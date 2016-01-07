require "./test/test_helper"

class MerchantsRelationshipApiTest < ApiTest

  def test_returns_collection_of_items_associated_with_a_merchant
    merchant_id = 34

    items = get_json("/api/v1/merchants/#{merchant_id}/items")

    assert_equal 42, items.count
    items.each do |item|
      assert_equal merchant_id, item["merchant_id"]
      assert item["name"]
      assert item["description"]
    end
  end

  def test_returns_collection_of_invoices_associated_with_a_merchant
    merchant_id = 45

    invoices = get_json("/api/v1/merchants/#{merchant_id}/invoices")

    assert_equal 48, invoices.count
    invoices.each do |invoice|
      assert_equal merchant_id, invoice["merchant_id"]
    end
  end
end
