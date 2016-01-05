class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer

  def self.random
    order.("RANDOM()").first
  end
end
