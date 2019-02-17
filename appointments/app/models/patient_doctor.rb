class PatientDoctor < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient
    has_many :appointments, dependent: :delete_all
end
