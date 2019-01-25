Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contacts' => 'contacts#index'
  post '/contacts' => 'contacts#create'
  post '/contacts/edit' => 'contacts#update'
  get '/contacts/new' => 'contacts#new'
  get '/contacts/edit' => 'contacts#edit'
end
