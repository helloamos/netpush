Rails.application.routes.draw do
    #devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root "dashboard#index"
    get "dashboard" => "dashboard#index"
    get "dashboard/mail-broadcast-list" => "mail_broadcast_lists#index", as: :mail_broadcast_list
    get "dashboard/phone-broadcast-list" => "phone_broadcast_lists#index", as: :phone_broadcast_list
    devise_for :users, path: 'auth', path_names: { 
      sign_in: 'login', 
      sign_out: 'logout', 
      password: 'secret', 
      confirmation: 'verification', 
      unlock: 'unblock', 
      registration: 'register', 
      sign_up: 'cmon_let_me_in' 
    }

    resources :mail_broadcast_lists do
      get 'delete'
    end

    resources :phone_broadcast_lists do
      get 'delete'
    end


end
