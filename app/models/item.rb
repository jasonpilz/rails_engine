class Item < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :invoice_items

  belongs_to :merchant

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = unit_price / 100.00
  end

  def self.random
    order.("RANDOM()").first
  end
end
