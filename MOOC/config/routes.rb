Rails.application.routes.draw do
  resources :comments
  resources :courses
  resources :lectures
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registerations: 'users/registerations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :lectures do 
  member do
    put "like", to: "lectures#upvote"
    put "dislike", to: "lectures#downvote"
  end
end
end
