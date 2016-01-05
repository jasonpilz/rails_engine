require 'csv'
require 'json'
require 'pry'

namespace :db do
  desc "Import the customers, merchants, transactions, items, invoices and invoice items"
  task import: :environment do
    customers     = csv_data_from("#{Rails.root}/lib/assets/customers.csv")
    merchants     = csv_data_from("#{Rails.root}/lib/assets/merchants.csv")
    items         = csv_data_from("#{Rails.root}/lib/assets/items.csv")
    invoices      = csv_data_from("#{Rails.root}/lib/assets/invoices.csv")
    transactions  = csv_data_from("#{Rails.root}/lib/assets/transactions.csv")
    invoice_items = csv_data_from("#{Rails.root}/lib/assets/invoice_items.csv")

    populate_customers(customers)
    populate_merchants(merchants)
    populate_items(items)
    populate_invoices(invoices)
    populate_transactions(transactions)
    populate_invoice_items(invoice_items)
  end

end

private

  def csv_data_from(filename)
    CSV.read(filename, headers: true, header_converters: :symbol)
       .map(&:to_h)
  end

  def populate_customers(customers)
    customers.each do |customer|
      customer = Customer.create!(id: customer[:id].to_i,
                                  first_name: customer[:first_name],
                                  last_name: customer[:last_name],
                                  created_at: customer[:created_at],
                                  updated_at: customer[:updated_at])
      puts_created(customer)
    end
  end

  def populate_merchants(merchants)
    merchants.each do |merchant|
      merchant = Merchant.create!(id: merchant[:id].to_i,
                                  name: merchant[:name],
                                  created_at: merchant[:created_at],
                                  updated_at: merchant[:updated_at])
      puts_created(merchant)
    end
  end

  def populate_items(items)
    items.each do |item|
      item = Item.create!(id: item[:id].to_i,
                          name: item[:name],
                          description: item[:description],
                          unit_price: item[:unit_price],
                          merchant_id: item[:merchant_id],
                          created_at: item[:created_at],
                          updated_at: item[:updated_at])
      puts_created(item)
    end
  end

  def populate_invoices(invoices)
    invoices.each do |invoice|
      invoice = Invoice.create!(id: invoice[:id],
                                status: invoice[:status],
                                customer_id: invoice[:customer_id],
                                merchant_id: invoice[:merchant_id],
                                created_at: invoice[:created_at],
                                updated_at: invoice[:updated_at])
      puts_created(invoice)
    end
  end

  def populate_transactions(transactions)
    transactions.each do |transaction|
      transaction = Transaction.create!(id: transaction[:id],
                                         credit_card_number: transaction[:credit_card_number],
                                         result: transaction[:result],
                                         invoice_id: transaction[:invoice_id],
                                         created_at: transaction[:created_at],
                                         updated_at: transaction[:updated_at])
      puts_created(transaction)
    end
  end

  def populate_invoice_items(invoice_items)
    invoice_items.each do |invoice_item|
      invoice_item = InvoiceItem.create!(id: invoice_item[:id],
                                         quantity: invoice_item[:quantity],
                                         unit_price: invoice_item[:unit_price],
                                         invoice_id: invoice_item[:invoice_id],
                                         item_id: invoice_item[:item_id],
                                         created_at: invoice_item[:created_at],
                                         updated_at: invoice_item[:updated_at])
      puts_created(invoice_item)
    end
  end

  def puts_created(object)
    puts "Created: #{object.class.to_s}, ID: #{object.id}"
  end

