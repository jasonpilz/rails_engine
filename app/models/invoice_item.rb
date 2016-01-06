class InvoiceItem < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  belongs_to :invoice
  belongs_to :item

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = unit_price / 100.00
  end

  def self.random
    order.("RANDOM()").first
  end
end
