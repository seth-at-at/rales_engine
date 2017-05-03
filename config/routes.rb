Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :items do
        get "/find", to: "find#show"
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get "/find", to: "find#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get "/find", to: "find#show"
      end
      resources :invoice_items, only: [:index, :show]

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
