class Merchant < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  # use serializer to format
  def self.revenue_by_date(date, id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
      .where("transactions.result = ? AND merchants.id = ? AND invoices.created_at = ?", "success", id, date)
      .sum("invoice_items.quantity * invoice_items.unit_price") }
  end

  def self.revenue(id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
      .where("transactions.result = ? AND merchants.id = ?", "success", id)
      .sum("invoice_items.quantity * invoice_items.unit_price") }
  end

  def self.all_revenue_by_date(date)
    { "total_revenue" => joins(invoices: [:transactions, :invoice_items])
      .where("transactions.result = ? AND invoices.created_at = ?", "success", date)
      .sum("invoice_items.quantity * invoice_items.unit_price") }
  end

  def pending_customers
    need_to_pay = []
    invoices.pending_transactions.map { |invoice| need_to_pay << invoice.customer }
    need_to_pay.uniq
  end

  def favorite_customer
    Customer.joins(:invoices)
            .joins(:transactions)
            .unscope(:order)
            .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.customer_id) DESC')
            .first
  end

  # def favorite_customer
  #   customer_purchases = invoices.successful_transactions.unscope(:order).group(:customer_id).count
  #   customer_id = customer_purchases.max_by { |_, v| v }.first
  #   Customer.find(customer_id)
  # end
end
