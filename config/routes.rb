# config/routes.rb
Rails.application.routes.draw do
  # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :scores, only: [:index]
      # get '*path', to: 'base#render_not_found'
    end
  end
end

# why not a collection
