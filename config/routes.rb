Rails.application.routes.draw do
  root 'posts#index'
  
  
  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
    
    
  ## get '/user/:id', to: 'users#show'
  ## means /user/3 -> Users controller, show action, params {id: '3'}
  resources :users, only: [:show]
  
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
  end
end
