require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  should belong_to(:customer)
  should belong_to(:merchant)

  should have_many(:invoice_items)
  should have_many(:transactions)
end
