Rails.application.routes.draw do
  resources :comixes do
    collection do
      match '', via: :options, action: 'show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
