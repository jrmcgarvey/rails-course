Rails.application.routes.draw do
    resources :courses
    resources :students
    root 'courses#index'
end
