ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'faraday'
require "./test/custom_assertions"

SimpleCov.start("rails")

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ApiTest < Minitest::Test
  include CustomAssertions

  def base_url
    ENV["BASE_URL"] || "http://rails_engine.dev"
  end

  def connection
    @connection ||= Faraday.new(url: base_url)
  end

  def get_json(path)
    response = connection.get(path)
    assert_equal 200, response.status, "Expected 200, got status#{response.status}"
    assert_valid_json(response.body)
  end
end

DatabaseCleaner.strategy = :transaction

class Minitest::Spec
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
