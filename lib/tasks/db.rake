require 'csv'
require 'json'
require 'pry'

namespace :db do
  desc "Import the customers, merchants, transactions, items, invoices and invoice items"
  task import: :environment do
    customers = csv_data_from("#{Rails.root}/lib/assets/customers.csv")
    merchants = csv_data_from("#{Rails.root}/lib/assets/merchants.csv")

    populate_customers(customers)
    populate_merchants(merchants)
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
                                  last_name: customer[:last_name])
      puts_created(customer)
    end
  end

  def populate_merchants(merchants)
  end

  def puts_created(object)
    puts "Created: #{object.class.to_s}, ID: #{object.id}"
  end

  # def json_data_from(data)
  #   JSON.generate(data)
  # end

  # def formatted_json_from(data)
  #   JSON.pretty_generate(data)
  # end
