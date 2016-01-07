class Transaction < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  belongs_to :invoice

  has_many :invoice_items, through: :invoices

  def self.random
    order("RANDOM()").first
  end

end
