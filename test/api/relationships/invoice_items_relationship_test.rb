require "./test/test_helper"

class InvoiceItemsApiTest < ApiTest
  def test_loads_the_associated_item
    invoice_item_id = 5

    item = get_json("/api/v1/invoice_items/#{invoice_item_id}/item")
    assert_equal 529,            item["id"]
    assert_equal "Item Eius Et", item["name"]
  end

  def test_loads_the_associated_invoice
    invoice_item_id = 7

    invoice = get_json("/api/v1/invoice_items/#{invoice_item_id}/invoice")
    assert_equal 1, invoice["id"]
    assert_equal 1, invoice["customer_id"]
  end
end
