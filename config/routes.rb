Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show], defaults: {format: :json} do
        resources :invoices, only: [:index], module: "customers", defaults: {format: :json}
        resources :transactions, only: [:index], module: "customers", defaults: {format: :json}
        resource :favorite_merchant, only: [:show], module: "customers", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        resources :items, only: [:index], module: "merchants", defaults: {format: :json}
        resources :invoices, only: [:index], module: "merchants", defaults: {format: :json}
        resource :revenue, only: [:show], module: "merchants", defaults: {format: :json}
        resource :favorite_customer, only: [:show], module: "merchants", defaults: {format: :json}
        resource :customers_with_pending_invoices, only: [:show], module: "merchants", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
          get 'revenue',         to: 'merchants/merchant_revenues#show'
          get 'most_revenue',    to: 'merchants/most_revenues#show'
          get 'most_items',      to: 'merchants/most_items#show'
        end
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        resources :transactions, only: [:index], module: "invoices", defaults: {format: :json}
        resources :invoice_items, only: [:index], module: "invoices", defaults: {format: :json}
        resources :items, only: [:index], module: "invoices", defaults: {format: :json}
        resource :customer, only: [:show], module: "invoices", defaults: {format: :json}
        resource :merchant, only: [:show], module: "invoices", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:index, :show], defaults: {format: :json} do
        resources :invoice_items, only: [:index], module: "items", defaults: {format: :json}
        resource :merchant, only: [:show], module: "items", defaults: {format: :json}
        resource :best_day, only: [:show], module: "items", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
          get 'most_revenue',    to: 'items/most_revenues#show'
          get 'most_items',      to: 'items/most_items#show'
        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        resource :invoice, only: [:show], module: "invoice_items", defaults: {format: :json}
        resource :item, only: [:show], module: "invoice_items", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        resource :invoice, only: [:show], module: "transactions", defaults: {format: :json}
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
