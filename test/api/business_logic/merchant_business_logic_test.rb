require "./test/test_helper"

class MerchantApiBusinessLogicTest < ApiTest

  def test_returns_the_favorite_customer_associated_with_a_merchant
    first_merch_id  = 33
    second_merch_id = 23

    fav_customer_one = get_json("/api/v1/merchants/#{first_merch_id}/favorite_customer")
    fav_customer_two = get_json("/api/v1/merchants/#{second_merch_id}/favorite_customer")

    assert_equal 276, fav_customer_one["id"]
    assert_equal 828, fav_customer_two["id"]
  end

  def test_returns_customers_with_pending_transactions_associated_with_a_merchant
    first_merch_id  = 9
    second_merch_id = 88

    customer_one = get_json("/api/v1/merchants/#{first_merch_id}/customers_with_pending_invoices")
    customer_two = get_json("/api/v1/merchants/#{second_merch_id}/customers_with_pending_invoices")

    assert_equal 13, customer_one.size
    assert_equal 8,  customer_two.size
  end

  def test_returns_total_revenue_accross_all_transactions_associated_with_a_merchant
    first_merch_id  = 65
    second_merch_id = 56

    revenue_one = get_json("/api/v1/merchants/#{first_merch_id}/revenue")
    revenue_two = get_json("/api/v1/merchants/#{second_merch_id}/revenue")

    assert_equal ({ "revenue" => "709601.95" }), revenue_one
    assert_equal ({ "revenue" => "659740.42" }), revenue_two
  end

  def test_returns_total_revenue_accross_all_transactions_associated_with_a_merchant_by_date
    first_merch_id  = 30
    second_merch_id = 3
    date_one        = "2012-03-16 11:55:05"
    date_two        = "2012-03-07 10:54:55"

    revenue_one = get_json("/api/v1/merchants/#{first_merch_id}/revenue?date=#{date_one}")
    revenue_two = get_json("/api/v1/merchants/#{second_merch_id}/revenue?date=#{date_two}")

    assert_equal ({ "revenue" => "1518.84" }), revenue_one
    assert_equal ({ "revenue" => "3004.65" }), revenue_two
  end

  def test_returns_total_revenue_for_a_date_accross_all_merchants
    date_one = "2012-03-16 11:55:05"
    date_two = "2012-03-07 10:54:55"

    total_revenue_one = get_json("/api/v1/merchants/revenue?date=#{date_one}")
    total_revenue_two = get_json("/api/v1/merchants/revenue?date=#{date_two}")

    assert_equal ({ "total_revenue" => "1518.84" }), total_revenue_one
    assert_equal ({ "total_revenue" => "3004.65" }), total_revenue_two
  end
end
