# config/routes.rb
Rails.application.routes.draw do

  # V1 version
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :scores, only: [:index]
      # get '*path', to: 'base#render_not_found'
    end
  end

  #v2 version
  namespace :api, defaults: { format: :json } do
    namespace :v2 do
      resources :scores, only: [:index]
      get '*path', to: 'base#render_not_found'
    end
  end


  #v3 version
  namespace :api, defaults: { format: :json } do
    namespace :v3 do
      resources :scores, only: [:index]
      get '*path', to: 'base#render_not_found'
    end
  end

end
# why not a collection
