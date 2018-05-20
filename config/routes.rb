Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Commontator::Engine => '/commontator'

  root 'home#home'

  resources :lectures do
    member do
      post :spam
      put "like", to: "lectures#like"
      put "dislike", to: "lectures#dislike"
    end
  end

  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
