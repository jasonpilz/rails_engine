require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:invoice)

  test "invoice item gets created with correct attributes" do
    invoice = Invoice.last
    item = Item.last
    invoice_item = InvoiceItem.create!(quantity: 3,
                                       item_id: item.id,
                                       invoice_id: invoice.id,
                                       unit_price: 34566)

    assert_equal 3, invoice_item.quantity
    assert_equal item.id, invoice_item.item_id
    assert_equal invoice.id, invoice_item.invoice_id
    assert_equal 345.66, invoice_item.unit_price.to_f
  end
end
