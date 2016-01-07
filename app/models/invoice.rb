class Invoice < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  belongs_to :merchant
  belongs_to :customer

  def self.random
    order("RANDOM()").first
  end

  def self.successful_transactions
    joins(:transactions).where(transactions: { result: "success" })
  end

  def self.pending_transactions
    joins(:transactions).where(transactions: { result: "failed" })
  end
end
