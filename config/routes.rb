Rails.application.routes.draw do
  get 'usuarios/index'

  get 'mysongs/index'

  post 'deletesong/:song_id', as: 'deletesong', to: 'mysongs#deletesong'

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

  get 'songsof/:user_id' => 'usuarios#songsof', as: :'songsof' 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
