Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers',              to: "customers#index"
      get '/customers/find',         to: "customers#find"
      get '/customers/find_all',     to: "customers#find_all"
      get '/customers/random',       to: "customers#random"
      get '/customers/:id',          to: "customers#show"

      get '/merchants',              to: "merchants#index"
      get '/merchants/find',         to: "merchants#find"
      get '/merchants/find_all',     to: "merchants#find_all"
      get '/merchants/random',       to: "merchants#random"
      get '/merchants/:id',          to: "merchants#show"

      get '/invoices',               to: "invoices#index"
      get '/invoices/find',          to: "invoices#find"
      get '/invoices/find_all',      to: "invoices#find_all"
      get '/invoices/random',        to: "invoices#random"
      get '/invoices/:id',           to: "invoices#show"

      get '/items',                  to: "items#index"
      get '/items/find',             to: "items#find"
      get '/items/find_all',         to: "items#find_all"
      get '/items/random',           to: "items#random"
      get '/items/:id',              to: "items#show"

      get '/invoice_items',          to: "invoice_items#index"
      get '/invoice_items/find',     to: "invoice_items#find"
      get '/invoice_items/find_all', to: "invoice_items#find_all"
      get '/invoice_items/random',   to: "invoice_items#random"
      get '/invoice_items/:id',      to: "invoice_items#show"

      get '/transactions',           to: "transactions#index"
      get '/transactions/find',      to: "transactions#find"
      get '/transactions/find_all',  to: "transactions#find_all"
      get '/transactions/random',    to: "transactions#random"
      get '/transactions/:id',       to: "transactions#show"
    end
  end
end
