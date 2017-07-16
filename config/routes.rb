Rails.application.routes.draw do
    #devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root "dashboard#index"
    get "dashboard" => "dashboard#index"
    get "dashboard/mail-broadcast-lists" => "mail_broadcast_lists#index", as: :mail_broadcast_list
    get "dashboard/phone-broadcast-lists" => "phone_broadcast_lists#index", as: :phone_broadcast_list
    get "dashboard/mail-lists" => "mail_lists#index", as: :mail_list
    get "dashboard/phone-lists" => "phone_lists#index", as: :phone_list
    get "dashboard/campaigns" => "campaigns#index", as: :campaigns

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

    resources :mail_lists do
      get 'delete'
    end

    resources :phone_lists do
      get 'delete'
    end

    resources :campaigns do
      get 'delete'
    end


end
