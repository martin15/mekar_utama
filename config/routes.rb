Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get "new-home" => "new_home#index"
  get "about_us" => "about_us#index"
  get "clients" => "clients#index"
  get "products/:permalink" => "products#index", :as => "products"
  get "products/:name/:permalink" => "products#show", :as => "product"
  get "contact_us" => "contact_us#new", :as => "contact_us"
  # post "contact_us" => "contact_us#create", :as => "contact_us"
  get "news" => "news#index", :as => "news"
  get "news/:id" => "news#show", :as => "show_news"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :only => [:create]


  get 'tentang-kompor-induksi' => 'home#kompor_induksi', as: "kompor_induksi"
  post "contact_us" => "home#contact_us", as: "save_contact_us"

  get "admin" => "admin/dashboard#index", :as => "admin"
  post "admin/dashboard/change_password"

 namespace :admin do
    resources :banners
    resources :clients
    resources :features
    resources :news, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :products do
      resources :product_images, :only => [:create, :edit, :update, :destroy] do
        member do
          get 'set_primary'
          get 'set_best_seller'
        end
      end
    end
    resources :categories
    resources :product_images, :only => [:index]
    get "product_images/:id/new_product" => "product_images#new_product", :as => "product_images_new_product"
    post "product_images/:id/create_product" => "product_images#create_product", :as => "product_images_create_product"
    get "settings/:name/edit" => "settings#edit", :as => "edit_setting"
    put "settings/:name" => "settings#update", :as => "update_setting"

    
  end

  root :to => 'home#index'
end
