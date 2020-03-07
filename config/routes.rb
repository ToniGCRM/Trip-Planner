Rails.application.routes.draw do
  root 'static_pages#home'


    resources :users do
      resources :trips
    end
    resources :trips do
      resources :locations
    end
    resources :locations do
      resources :addresses
    end

end
