class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  default_scope -> { order('id DESC') }

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    merchant_purchases = invoices.successful_transactions.unscope(:order).group(:merchant_id).count
    merchant_id = merchant_purchases.max_by { |_, v| v }.first
    Merchant.find(merchant_id)
  end
end
