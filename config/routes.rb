Rails.application.routes.draw do
  resources :book_collections
  resources :books do 
    resources :appraisals
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'add_to_collection/:book_id', to: 'book_collections#add'
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
