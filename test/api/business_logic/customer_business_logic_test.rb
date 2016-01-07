require "./test/test_helper"

class CustomerApiBusinessLogicTest < ApiTest

  def test_returns_favorite_merchant_associated_with_a_customer
    first_customer_id  = 45
    second_customer_id = 12
    fav_merch_one = get_json("/api/v1/customers/#{first_customer_id}/favorite_merchant")
    fav_merch_two = get_json("/api/v1/customers/#{second_customer_id}/favorite_merchant")

    assert_equal 29,          fav_merch_one["id"]
    assert_equal "Tromp Inc", fav_merch_one["name"]

    assert_equal 11,                 fav_merch_two["id"]
    assert_equal "Pollich and Sons", fav_merch_two["name"]
  end
end
