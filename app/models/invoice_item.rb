class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = unit_price / 100.00
  end
end
