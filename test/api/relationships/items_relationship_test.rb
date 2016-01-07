require "./test/test_helper"

class ItemsApiTest < ApiTest
  def test_returns_a_collection_of_invoice_items_associated_with_one_item
    item_id = 764

    invoice_items = get_json("/api/v1/items/#{item_id}/invoice_items")

    assert_equal 4, invoice_items.count
    invoice_items.each do |invoice_item|
      assert_equal 764, invoice_item["item_id"]
    end
  end

  def test_returns_the_associated_merchant
    item_id = 777

    merchant = get_json("/api/v1/items/#{item_id}/merchant")
    assert_equal 35,               merchant["id"]
    assert_equal "Schuster Group", merchant["name"]
  end
end
