Rails.application.routes.draw do
  resources :categories
  root to: 'posts#index'
  resources :comment_replies
  resources :reply_posts
  resources :posts
  devise_for :users, :controllers => {
    :registrations => "registration/registrations",
    :passwords => "registrations/passwords",
    :session => "sessions/sessions"
  } 
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
