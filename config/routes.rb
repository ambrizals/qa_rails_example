Rails.application.routes.draw do
  resources :comment_replies
  resources :post_replies
  resources :posts
  scope 'categories' do
    get 'deleted', to: 'categories#deleted', as: 'deleted_category'
    post 'restore/:id', to: 'categories#restore', as: 'restore_category'
  end  
  resources :categories
  root to: 'posts#index'
  devise_for :users, :controllers => {
    :registrations => "registration/registrations",
    :passwords => "registrations/passwords",
    :sessions => "session/sessions",
  } 
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
