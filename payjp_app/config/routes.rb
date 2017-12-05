Rails.application.routes.draw do

  resources :products do
    collection do
      get :purchase
    end
  end
end
