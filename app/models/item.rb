class Item < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :invoice_items
  belongs_to :merchant

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = unit_price / 100.00
  end

  def self.random
    order("RANDOM()").first
  end

  def self.most_revenue_items(quantity)
    Item.select("items.*, count(invoice_items.unit_price * invoice_items.quantity) AS item_revenue")
        .joins(invoice_items: [invoice: :transactions])
        .where("transactions.result = ?", "success")
        .order("item_revenue DESC")
        .take(quantity)
  end
end
