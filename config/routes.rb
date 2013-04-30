BulgarianMediaTimeline::Application.routes.draw do
  resources :pages

  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
