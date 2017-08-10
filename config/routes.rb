Rails.application.routes.draw do
  get 'mysongs/index'

  resources :songs do
    member do 
      post 'addsong', as: 'addsong', to: 'songs#addsong'
    end    
  end
  
  resources :genres

  devise_for :users, controllers: {
        registrations: 'users/registrations'

      }
  root 'songs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
