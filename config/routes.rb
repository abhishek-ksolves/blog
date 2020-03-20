Rails.application.routes.draw do
  resources :likes
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
       #sessions: 'users/sessions',
       #omniauth_callbacks: 'omniauth',
       #registrations: "users/registrations"
     }

  get 'welcome/index'


  resources :articles do
    resources :comments
    resources :thumbs
  end

  #get 'auth/:provider/callback', to: 'sessions#googleAuth'

  #get 'auth/failure', to: redirect('/')

  get '/card/index' => 'billing#index',as: :billing

  get '/card/new' => 'billing#new_card', as: :add_payment_method


  post "/card" => "billing#create_card", as: :create_payment_method

  get '/success' => 'billing#success', as: :success

  post '/subscription' => 'billing#subscribe', as: :subscribe

  root 'welcome#index'


end
