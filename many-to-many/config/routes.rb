Rails.application.routes.draw do
    delete '/patients/delete_doctor' => 'patients#delete_doctor'
    resources :doctors, :patients
    root 'patients#index'
    post '/patients/add_doctor' => 'patients#add_doctor'
end
