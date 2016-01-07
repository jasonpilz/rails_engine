require "./test/test_helper"

class CustomerApiRelationshipTest < ApiTest

 def test_returns_a_collection_of_invoices_associated_with_a_customer
   customer_id = 45

   invoices = get_json("/api/v1/customers/#{customer_id}/invoices")

   assert_equal 5, invoices.count
   invoices.each do |invoice|
     assert_equal customer_id, invoice["customer_id"]
   end
 end

 def test_returns_a_collection_of_transactions_associated_with_a_customer
   customer_id = 55

   transactions = get_json("/api/v1/customers/#{customer_id}/transactions").flatten

   assert_equal 5, transactions.count
   transactions.each do |transaction|
     assert transaction["credit_card_number"]
     assert transaction["result"]
     assert transaction["invoice_id"]
     assert transaction["id"]
   end
 end
end
