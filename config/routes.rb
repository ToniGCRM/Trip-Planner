Rails.application.routes.draw do

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
