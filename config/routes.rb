Rails.application.routes.draw do
  root 'static_pages#home'
  post 'signup' => 'users#create'
  get '/signup' => 'users#new'
  get '/help' => 'static_pages#help'
  get '/about'=> 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
