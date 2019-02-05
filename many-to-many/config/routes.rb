Rails.application.routes.draw do
    resources :doctors, :patients
    root 'patients#index'
    post '/patients/add_doctor' => 'patients#add_doctor'
end
