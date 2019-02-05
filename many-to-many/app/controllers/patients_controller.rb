class PatientsController < ApplicationController
    def index
        @patients = Patient.all
    end
    
    def show
        @patient = Patient.find(params[:id])
        @doctors = Doctor.all
    end
    
    def new
        @patient = Patient.new
    end
    
    def create
        patient = Patient.new
        patient.first_name = params[:patient][:first_name]
        patient.last_name = params[:patient][:last_name]
        patient.email = params[:patient][:email]
        patient.phone = params[:patient][:phone]
        patient.save
        redirect_to patients_path
    end
    
    def edit
        @patient = Patient.find(params[:id])
    end
    
    def update
        patient = Patient.find(params[:id])
        patient.first_name = params[:patient][:first_name]
        patient.last_name = params[:patient][:last_name]
        patient.email = params[:patient][:email]
        patient.phone = params[:patient][:phone]
        patient.save
        redirect_to patients_path
    end
    
    def destroy
        patient = Patient.find(params[:id])
        patient.destroy
        redirect_to patients_path
    end
    
    def add_doctor
        patient_doctor = PatientDoctor.new
        patient_doctor.patient_id = params[:patient_id]
        patient_doctor.doctor_id = params[:doctor_id]
        if PatientDoctor.where('patient_id = ? AND doctor_id = ?',params[:patient_id],params[:doctor_id]).length == 0
            patient_doctor.save
        end
        redirect_to patient_path(id: params[:patient_id])
    end
end
