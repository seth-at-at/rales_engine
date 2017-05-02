Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
      resources :customers, except: [:new, :edit]
    end
  end
end
