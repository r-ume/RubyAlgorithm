Rails.application.routes.draw do

  resources :products do
    collection do
      post :purchase
    end
  end
end
