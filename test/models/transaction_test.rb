require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  should belong_to(:invoice)
end
