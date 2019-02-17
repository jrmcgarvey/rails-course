# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  delete '/patients/cancel_appointment' => 'patients#cancel_appointment'
  resources :doctors

  resources :patients do
    member do
      get 'set_doctors'
      post 'add_doctor1'
      delete 'remove_doctor1'
    end
    collection do
      get 'logoff'
    end
  end

  root 'patients#index'
  post '/patients/add_appointment' => 'patients#add_appointment'
end
