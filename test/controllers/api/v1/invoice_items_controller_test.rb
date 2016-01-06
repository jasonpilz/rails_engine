require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of invoice items" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal InvoiceItem.count, json_response.count
  end

  test "#index returns invoice items that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |invoice_item|
      assert invoice_item["quantity"]
      assert invoice_item["unit_price"]
    end
  end

  test "#show responds to json" do
    get :show, id: InvoiceItem.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: InvoiceItem.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#find can find by id" do
    get :find, format: :json, id: InvoiceItem.first.id
    json_response = JSON.parse(response.body)

    assert_equal InvoiceItem.first.id, json_response["id"]
  end

  test "#find can find by quantity" do
    get :find, format: :json, quantity: InvoiceItem.last.quantity
    json_response = JSON.parse(response.body)

    assert_equal InvoiceItem.last.quantity, json_response["quantity"]
  end

  test "#find can find by unit_price" do
    get :find, format: :json, unit_price: InvoiceItem.last.unit_price
    json_response = JSON.parse(response.body)

    assert_equal InvoiceItem.last.unit_price.to_s, json_response["unit_price"]
  end

  test "#find_all can find all by quantity" do
    get :find_all, format: :json, quantity: InvoiceItem.first.quantity
    json_response = JSON.parse(response.body)

    assert_equal (InvoiceItem.count) -1, json_response.count
  end

  test "#find_all can find all by unit_price" do
    get :find_all, format: :json, unit_price: InvoiceItem.first.unit_price
    json_response = JSON.parse(response.body)

    assert_equal 2, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert_equal 7, json_response.count
  end
end
