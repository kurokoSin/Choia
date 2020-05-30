Rails.application.routes.draw do
  # resources :topics
  get 'topics'   => 'topics#index'
  # get 'topics/:begin/:end' => 'topics#show'
  get 'topics/:begin/:end' => 'topics#list'
  post 'topics' => 'topics#create'

  resources :comixes do
    collection do
      match '', via: :options, action: 'show'
    end
  end

  delete 'comixes/:mon/:publisher' => 'comixes#del_mon'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
