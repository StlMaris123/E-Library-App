Rails.application.routes.draw do


 root 'fixed_pages#home'

  get 'faq' => 'fixed_pages#faq'

  get 'about' => 'fixed_pages#about'

  get 'contact' => 'fixed_pages#contact'


  resources :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
