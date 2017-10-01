Rails.application.routes.draw do
  get 'uploader/index'

  get 'uploader/form'

  post 'uploader/upload'

  get 'uploader/download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
