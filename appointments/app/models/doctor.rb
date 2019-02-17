class Doctor < ApplicationRecord
    has_many :patient_doctors, dependent: :delete_all
    has_many :patients, through: :patient_doctors
    has_many :appointments, through: :patient_doctors
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :specialty, presence: true
    validates :phone, presence: true
    validates :picture, presence: true
    validates :email, presence: true, uniqueness: true
end
