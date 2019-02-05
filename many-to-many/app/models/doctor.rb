class Doctor < ApplicationRecord
    has_many :patient_doctors, dependent: :delete_all
    has_many :patients, through: :patient_doctors
end
