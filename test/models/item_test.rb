require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:merchant)
  should have_many(:invoice_items)
end
