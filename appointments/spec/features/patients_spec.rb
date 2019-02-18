require 'rails_helper'

RSpec.feature "Patients", type: :feature do
  include Warden::Test::Helpers

  def setup
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end
  
#  it "should create a patient", js: true do
  it "should create a patient" do
    setup
    visit '/patients'
#    save_screenshot('test.png')
    click_on 'New'
    fill_in 'First Name', with: 'Jack'
    fill_in 'Last Name', with: 'Jones'
    fill_in 'Email', with: 'jjones@sample.com'
    fill_in 'Phone', with: '1234567'
    click_on 'Save'
    
    # checking database
    patient = Patient.first
    expect(patient.first_name).to eq('Jack')
    
    # check for text on page
    expect(page).to have_content('Jones')
  end
  
  it "should update a patient" do
    setup
    patient = Patient.create(
      first_name: 'Fred',
      last_name: 'Ames',
      email: 'fames@sample.com',
      phone: '9999999'
    )
    
    visit '/patients'
    click_on 'Edit'
    fill_in 'First Name', with: 'Philip'
    click_on 'Save'
    
    patient.reload
    expect(patient.first_name).to eq("Philip")
  end
end
