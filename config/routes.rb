Rails.application.routes.draw do
  devise_for :users
  root :to => 'sessions#new'

    resources :users do
      resources :messages
      resources :contacts
    end

    get '/log-in' => 'sessions#new'
    post '/log-in' => 'sessions#create'
    get '/log-in' => 'sessions#destroy'

end
