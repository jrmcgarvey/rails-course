require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  include Devise::Test::ControllerHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end
    
  it 'should create patient' do
    setup
    post :create, params: { patient: { first_name: "John", last_name: "Smith", email: "js@sample.com", phone: '2345689' } }
    
    patient = Patient.first
    expect(patient.first_name).to eq('John')
  end
  
  it 'should update patient' do
    setup
    patient = Patient.create(
      first_name: 'John',
      last_name: 'Jones',
      email: 'jjones@sample.com',
      phone: '1234559'
    )
    
    patient_params = { 
      first_name: 'John', 
      last_name: 'Johnson', 
      email: 'jjohnson@sample.com', 
      phone: '2934026'
    } 
    
    put :update, params: { patient: patient_params, id: patient.id }
    
    patient.reload
    
    expect(patient.last_name).to eq("Johnson")
  end
end
