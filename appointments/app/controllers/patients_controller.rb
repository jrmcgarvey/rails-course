# frozen_string_literal: true

# Rails controller to handle operations on patients
class PatientsController < ApplicationController
  before_action :authenticate_user!

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
    @patient = Patient.new
    ret = store_patient(@patient, params)
    if ret == false
      render(:new)
    else
      redirect_to patients_path
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def store_patient(patient, params)
    patient.first_name = params[:patient][:first_name]
    patient.last_name = params[:patient][:last_name]
    patient.email = params[:patient][:email]
    patient.phone = params[:patient][:phone]
    patient.save
  end

  def update
    @patient = Patient.find(params[:id])
    ret = store_patient(@patient, params)
    if ret == false
      render :edit
    else
      redirect_to patients_path
    end
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to patients_path
  end

  def store_appointment(params)
    appointment = Appointment.new
    appointment.patient_doctor_id = params[:patient_doctor_id]
    appointment.location = params[:location]
    appointment.appointment_time = params[:appointment][:appointment_time]
    appointment.save
  end

  def add_appointment
    ret = store_appointment(params)
    if ret == false
      flash[:info] =
        'When creating an appointment, location and time are required.'
    end
    redirect_to patient_path(id: params[:patient_id])
  end

  def cancel_appointment
    appointment = Appointment.find(params[:id])
    patient_id = appointment.patient.id
    appointment.destroy
    redirect_to patient_path(id: patient_id)
  end

  def set_doctors
    @patient = Patient.find(params[:id])
    @doctors = Doctor.all
  end

  def make_doctor1(params)
    patient_doctor = PatientDoctor.new
    patient_doctor.patient_id = params[:id]
    patient_doctor.doctor_id = params[:doctor_id]
    patient_doctor
  end

  def add_doctor1
    patient_doctor = make_doctor1(params)
    if PatientDoctor.where('patient_id = ? AND doctor_id = ?',
                           params[:patient_id], params[:doctor_id]).empty?
      patient_doctor.save
    end
    redirect_to set_doctors_patient_path(params[:id])
  end

  def remove_doctor1
    patient_doctor = PatientDoctor.find(params[:patient_doctor_id])
    patient_id = patient_doctor.patient.id
    patient_doctor.destroy
    redirect_to set_doctors_patient_path(id: patient_id)
  end

  def logoff
    sign_out_and_redirect(current_user)
  end
end
