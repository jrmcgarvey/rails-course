class Appointment < ApplicationRecord
    belongs_to :patient_doctor
    has_one :patient, through: :patient_doctor
    has_one :doctor, through: :patient_doctor
    
    validates :location, presence: true
    validates :appointment_time, presence: true
end
