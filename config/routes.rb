Rails.application.routes.draw do
  resources :floorplan_objects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :floorplans, only: [:index, :show] do
    post '/apply', to: 'floorplans#apply'
    resources :problems, only: :none do
      resources :device_definitions, only: [:show, :create, :update, :destroy]
      resources :link_definitions
    end
  end
end
