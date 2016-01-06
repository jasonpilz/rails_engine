class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  default_scope -> { order('id DESC') }

  def self.random
    order.("RANDOM()").first
  end
end
