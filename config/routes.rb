Rails.application.routes.draw do
  get 'products/index'

   resources :chat_rooms, only: [:index, :show, :new, :create ] do
    resources :messages, only: [:create]
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
   # root "chat_rooms#index"
  resources :posts do
        post :like, on: :member
  end

  resources :products do
    collection do
      get :fetch_product
    end
  end
end
