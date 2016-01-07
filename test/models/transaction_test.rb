require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  should belong_to(:invoice)

  test "transaction gets created with correct attributes" do
    invoice = Invoice.last
    transaction = Transaction.create!(credit_card_number: 1111222233334444,
                                      result: "failed",
                                      invoice_id: invoice.id)
    assert_equal 1111222233334444, transaction.credit_card_number.to_i
    assert_equal "failed", transaction.result
    assert_equal invoice.id, transaction.invoice_id
  end
end
