class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  default_scope -> { order('id DESC') }

  def self.random
    order.("RANDOM()").first
  end
end
