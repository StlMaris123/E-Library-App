Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

 root 'fixed_pages#home'

  get 'faq' => 'fixed_pages#faq'

  get 'about' => 'fixed_pages#about'

  get 'contact' => 'fixed_pages#contact'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
#get 'edit' => 'books#edit'
  resources :users 

  resources :account_activations, only: [:edit]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :books                

  resources :leases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
