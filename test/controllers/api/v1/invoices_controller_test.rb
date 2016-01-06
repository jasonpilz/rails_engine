require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of invoices" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal Invoice.count, json_response.count
  end

  test "#index returns invoices that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |invoice|
      assert invoice["status"]
    end
  end

  test "#show responds to json" do
    get :show, id: Invoice.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Invoice.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#find can find by id" do
    get :find, format: :json, id: Invoice.first.id
    json_response = JSON.parse(response.body)

    assert_equal Invoice.first.id, json_response["id"]
  end

  test "#find can find by status" do
    get :find, format: :json, status: Invoice.last.status
    json_response = JSON.parse(response.body)

    assert_equal Invoice.last.status, json_response["status"]
  end

  test "#find can find by merchant_id" do
    get :find, format: :json, merchant_id: Invoice.last.merchant_id
    json_response = JSON.parse(response.body)

    assert_equal Invoice.last.merchant_id, json_response["merchant_id"]
  end

  test "#find_all can find all by status" do
    get :find_all, format: :json, status: Invoice.first.status
    json_response = JSON.parse(response.body)

    assert_equal (InvoiceItem.count) -1, json_response.count
  end

  test "#find_all can find all by merchant_id" do
    get :find_all, format: :json, merchant_id: Invoice.first.merchant_id
    json_response = JSON.parse(response.body)

    assert_equal 2, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert_equal 6, json_response.count
  end
end
