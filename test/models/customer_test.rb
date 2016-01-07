require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should have_many(:invoices)

  test "customer class gets created with correct attributes" do
    Customer.create!(first_name: "Jason",
                     last_name: "Pilz")

    customer = Customer.last
    assert_equal "Jason", customer.first_name
    assert_equal "Pilz", customer.last_name
  end
end
