class Patient < ApplicationRecord
    has_many :patient_doctors, dependent: :delete_all
    has_many :doctors, through: :patient_doctors
    has_many :appointments, through: :patient_doctors
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :email, presence: true, uniqueness: true
end
