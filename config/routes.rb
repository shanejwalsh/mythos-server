Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#index'

  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :show, :new, :create, :destroy, :update]
      resources :users, only: [:index, :create, :show]


      post 'characters/clone', to: 'characters#clone'

      post 'login', to: 'users#login'
      get 'validate', to: 'users#validate'
      get '/mycharacters', to: 'users#get_characters'

      #Generate Routes
      get '/generate/full_character', to: 'generators#full_character'
      get '/generate/first_name', to: 'generators#first_name'
      get '/generate/last_name', to: 'generators#last_name'
      get '/generate/alias', to: 'generators#alias'
      get '/generate/motto', to: 'generators#motto'
      get '/generate/species', to: 'generators#species'
      get '/generate/bio', to: 'generators#bio'
      get '/generate/alignment', to: 'generators#alignment'
      get '/generate/traits_positive', to: 'generators#traits_positive'
      get '/generate/traits_negative', to: 'generators#traits_negative'
      get '/generate/age', to: 'generators#age'
      get '/generate/status', to: 'generators#status'
      get '/generate/gender', to: 'generators#gender'
      get '/generate/feats', to: 'generators#feats'
    end
  end
end
