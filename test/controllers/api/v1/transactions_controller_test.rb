require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase

  test "#index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    json_response = JSON.parse(response.body)
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of transactions" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    assert_equal Transaction.count, json_response.count
  end

  test "#index returns transactions that have the correct properties" do
    get :index, format: :json
    json_response = JSON.parse(response.body)

    json_response.each do |transaction|
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end

  test "#show responds to json" do
    get :show, id: Transaction.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    get :show, format: :json, id: Transaction.first.id
    json_response = JSON.parse(response.body)

    assert_kind_of Hash, json_response
  end

  test "#find can find by id" do
    get :find, format: :json, id: Transaction.first.id
    json_response = JSON.parse(response.body)

    assert_equal Transaction.first.id, json_response["id"]
  end

  test "#find can find by credit_card_number" do
    get :find, format: :json, credit_card_number: Transaction.first.credit_card_number
    json_response = JSON.parse(response.body)

    assert_equal Transaction.first.credit_card_number, json_response["credit_card_number"]
  end

  test "#find can find by result" do
    get :find, format: :json, result: Transaction.last.result
    json_response = JSON.parse(response.body)

    assert_equal Transaction.last.result, json_response["result"]
  end

  test "#find_all can find all by credit_card_number" do
    get :find_all, format: :json, name: Transaction.first.credit_card_number
    json_response = JSON.parse(response.body)

    assert_equal Transaction.count, json_response.count
  end

  test "#find_all can find all by result" do
    get :find_all, format: :json, result: Transaction.last.result
    json_response = JSON.parse(response.body)

    assert_equal 2, json_response.count
  end

  test "#random returns one random record" do
    get :random, format: :json
    json_response = JSON.parse(response.body)

    assert json_response["credit_card_number"]
    assert json_response["result"]
  end
end
