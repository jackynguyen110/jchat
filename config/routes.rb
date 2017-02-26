Rails.application.routes.draw do
  
  root 'home#index'
  
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/addfriend/:id' => "users#add_friend"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/sendmessage/:id' => "messages#newmessage"
  post '/sendmessage/:id' => "messages#createmessage"

  get '/readmessage/:id' => "messages#readmessage"
end
