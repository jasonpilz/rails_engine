require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  should have_many(:items)
  should have_many(:invoices)
end
