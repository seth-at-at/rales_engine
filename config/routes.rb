Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :items do
        get "/find_all", to: "find#index"
        get "/find",     to: "find#show"
        get "/random",   to: "random#show"
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get "/find",              to: "find#show"
        get "/random",            to: "random#show"
        get "/:id/merchant",      to: "merchant#show"
        get "/:id/customer",      to: "customer#show"
        get "/:id/items",         to: "items#index"
        get "/:id/transactions",  to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get "/find",   to: "find#show"
        get "/random", to: "random#show"
      end
      resources :invoice_items, only: [:index, :show]

      namespace :merchants do
        get "/find",         to: "find#show"
        get "/random",       to: "random#show"
        get "/:id/items",    to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get "/find",   to: "find#show"
        get "/random", to: "random#show"
      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get "/find",   to: "find#show"
        get "/random", to: "random#show"
      end
      resources :customers, only: [:index, :show]
    end
  end
end
