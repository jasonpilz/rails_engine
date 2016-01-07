require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of merchants" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal Merchant.count, json_response.count
  end

  test "#index returns merchants that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |merchant|
      assert merchant["name"]
    end
  end

  test "#show responds to json" do
    get :show, id: Merchant.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Merchant.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#find can find by id" do
    get :find, format: :json, id: Merchant.first.id
    json_response = JSON.parse(response.body)

    assert_equal Merchant.first.id, json_response["id"]
  end

  test "#find can find by name" do
    get :find, format: :json, name: Merchant.last.name
    json_response = JSON.parse(response.body)

    assert_equal Merchant.last.name, json_response["name"]
  end

  test "#find_all can find all by name" do
    get :find_all, format: :json, name: Merchant.last.name
    json_response = JSON.parse(response.body)

    assert_equal (Merchant.count) -1, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert json_response["name"]
  end
end
