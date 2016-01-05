Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers',         to: "customers#index"
      get '/customers/:id',     to: "customers#show"

      get '/merchants',         to: "merchants#index"
      get '/merchants/:id',     to: "merchants#show"

      get '/invoices',          to: "invoices#index"
      get '/invoices/:id',      to: "invoices#show"

      get '/items',             to: "items#index"
      get '/items/:id',         to: "items#show"

      get '/invoice_items',     to: "invoice_items#index"
      get '/invoice_items/:id', to: "invoice_items#show"

      get '/transactions',      to: "transactions#index"
      get '/transactions/:id',  to: "transactions#show"
    end
  end
end
