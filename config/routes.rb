Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers',     to: "customers#index"
      get '/customers/:id', to: "customers#show"
      # resources :merchants, except: [:new, :edit], defaults: {format: :json}
    end
  end
end
