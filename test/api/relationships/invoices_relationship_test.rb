require "./test/test_helper"

class InvoicesRelationshipApiTest < ApiTest

  def test_returns_collection_of_transactions_associated_with_a_invoice
    invoice_id = rand(1..4000)

    transactions = get_json("/api/v1/invoices/#{invoice_id}/transactions")

    transactions.each do |transaction|
      assert_equal invoice_id, transaction["invoice_id"]
      assert transaction["credit_card_number"]
      assert transaction["result"]
      assert transaction["id"]
    end
  end

  def test_returns_collection_of_items_associated_with_a_invoice
    invoice_id          = 4000
    invoice_merchant_id = 22

    items = get_json("/api/v1/invoices/#{invoice_id}/items")

    assert_equal 3, items.count
    items.each do |item|
      assert_equal invoice_merchant_id, item["merchant_id"]
      assert item["name"]
      assert item["description"]
      assert item["unit_price"]
    end
  end

  def test_returns_collection_of_invoice_items_for_one_invoice
    invoice_id = rand(1..4000)

    invoice_items = get_json("/api/v1/invoices/#{invoice_id}/invoice_items")

    invoice_items.each do |invoice_item|
      assert_equal invoice_id, invoice_item["invoice_id"]
      assert invoice_item["quantity"]
      assert invoice_item["unit_price"]
    end
  end

  def test_returns_the_associated_customer
    invoice_id = 456

    customer = get_json("/api/v1/invoices/#{invoice_id}/customer")

    assert_equal 93,      customer["id"]
    assert_equal "Nick",  customer["first_name"]
    assert_equal "Runte", customer["last_name"]
  end

  def test_returns_the_associated_merchant
    invoice_id = 3232

    merchant = get_json("/api/v1/invoices/#{invoice_id}/merchant")

    assert_equal 75,                  merchant["id"]
    assert_equal "Eichmann-Turcotte", merchant["name"]
  end
end
