Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/questions' => 'questions#index'
    get '/questions/new' => 'questions#new'
    post '/questions' => 'questions#create'
    get '/guess' => 'questions#guess'
    get '/answer' => 'questions#answer'
    get '/questions/edit' => 'questions#edit'
    post '/questions/edit'=> 'questions#edit_info'
end
