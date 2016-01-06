require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of customers" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal Customer.count, json_response.count
  end

  test "#index returns customers that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |customer|
      assert customer["first_name"]
      assert customer["last_name"]
    end
  end

  test "#show responds to json" do
    get :show, id: Customer.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Customer.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct customer" do
    get :show, format: :json, id: Customer.first.id
    json_response = JSON.parse(response.body)

    assert_equal Customer.first.id, json_response["id"]
  end

  test "#find can find by id" do
    get :find, format: :json, id: Customer.first.id
    json_response = JSON.parse(response.body)

    assert_equal Customer.first.id, json_response["id"]
  end

  test "#find can find by first_name" do
    get :find, format: :json, first_name: Customer.first.first_name
    json_response = JSON.parse(response.body)

    assert_equal Customer.first.first_name, json_response["first_name"]
  end

  test "#find can find by last_name" do
    get :find, format: :json, last_name: Customer.first.last_name
    json_response = JSON.parse(response.body)

    assert_equal Customer.first.last_name, json_response["last_name"]
  end

  test "#find_all can find all by first_name" do
    get :find_all, format: :json, first_name: Customer.first.first_name
    json_response = JSON.parse(response.body)

    assert_equal (Customer.count) -1, json_response.count
  end

  test "#find_all can find all by last_name" do
    get :find_all, format: :json, last_name: Customer.last.last_name
    json_response = JSON.parse(response.body)

    assert_equal 1, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert_equal 5, json_response.count
  end
end
