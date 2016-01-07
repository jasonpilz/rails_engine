require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:invoice)
end
