Boxify2::Application.routes.draw do

  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, 
  																	:path => "d"
	resources :users

	namespace :admin do
		match '/' => 'users#index'
		resources :users
	end

  root :to => "home#index"

  resources :boxes
  resources :subscriptions, :only => [:index, :create, :destroy]
  resources :shipments, :only => [:index, :edit, :create, :update, :destroy]
end
