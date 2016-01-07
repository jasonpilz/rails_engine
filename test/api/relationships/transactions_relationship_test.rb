require "./test/test_helper"

class TransactionApiTest < ApiTest
  def test_returns_the_associated_invoice
    transaction_id = 199

    invoice = get_json("/api/v1/transactions/#{transaction_id}/invoice")
    assert_equal 180,       invoice["id"]
    assert_equal "shipped", invoice["status"]
    assert_equal 68,        invoice["merchant_id"]
    assert_equal 38,        invoice["customer_id"]
  end
end
