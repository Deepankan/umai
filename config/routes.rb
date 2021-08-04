Rails.application.routes.draw do
  devise_for :users,
   controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
   }

   resources :posts, except: [:show] do
      resources :ratings, only: [:create]
   end

   get 'avg_rated_post' => 'posts#avg_rated_post'
   get 'all_ips' => 'posts#all_ips'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
