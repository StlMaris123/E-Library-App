Rails.application.routes.draw do


  get 'sessions/new'

 root 'fixed_pages#home'

  get 'faq' => 'fixed_pages#faq'

  get 'about' => 'fixed_pages#about'

  get 'contact' => 'fixed_pages#contact'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  resources :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
