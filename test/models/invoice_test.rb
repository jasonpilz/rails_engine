require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  should belong_to(:customer)
  should belong_to(:merchant)

  should have_many(:invoice_items)
  should have_many(:transactions)

  test "invoice gets created with correct attribues" do
    merchant = Merchant.last
    customer = Customer.last
    invoice = Invoice.create!(status: "success",
                              merchant_id: merchant.id,
                              customer_id: customer.id)

    assert_equal "success", invoice.status
    assert_equal merchant.id, invoice.merchant_id
    assert_equal customer.id, invoice.customer_id
  end
end
