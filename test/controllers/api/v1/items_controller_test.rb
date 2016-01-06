require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal Item.count, json_response.count
  end

  test "#index returns items that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |item|
      assert item["name"]
      assert item["description"]
    end
  end

  test "#show responds to json" do
    get :show, id: Item.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Item.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#find can find by id" do
    get :find, format: :json, id: Item.first.id
    json_response = JSON.parse(response.body)

    assert_equal Item.first.id, json_response["id"]
  end

  test "#find can find by name" do
    get :find, format: :json, name: Item.last.name
    json_response = JSON.parse(response.body)

    assert_equal Item.last.name, json_response["name"]
  end

  test "#find can find by description" do
    get :find, format: :json, description: Item.last.description
    json_response = JSON.parse(response.body)

    assert_equal Item.last.description, json_response["description"]
  end

  test "#find_all can find all by name" do
    get :find_all, format: :json, name: Item.first.name
    json_response = JSON.parse(response.body)

    assert_equal (Item.count) -1, json_response.count
  end

  test "#find_all can find all by description" do
    get :find_all, format: :json, description: Item.first.description
    json_response = JSON.parse(response.body)

    assert_equal 2, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert_equal 7, json_response.count
  end
end
