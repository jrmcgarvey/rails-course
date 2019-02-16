class DoctorsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @doctors = Doctor.all
    end
    
    def show
        @doctor = Doctor.find(params[:id])
    end
    
    def new
        @doctor = Doctor.new
    end
    
    def create
        @doctor = Doctor.new
        @doctor.first_name = params[:doctor][:first_name]
        @doctor.last_name = params[:doctor][:last_name]
        @doctor.email = params[:doctor][:email]
        @doctor.phone = params[:doctor][:phone]
        @doctor.specialty = params[:doctor][:specialty]
        @doctor.picture = params[:doctor][:picture]
        ret = @doctor.save
        if (ret == false)
            render :new
        else
            redirect_to doctors_path
        end
    end
    
    def edit
        @doctor = Doctor.find(params[:id])
    end
    
    def update
        @doctor = Doctor.find(params[:id])
        @doctor.first_name = params[:doctor][:first_name]
        @doctor.last_name = params[:doctor][:last_name]
        @doctor.email = params[:doctor][:email]
        @doctor.phone = params[:doctor][:phone]
        @doctor.specialty = params[:doctor][:specialty]
        @doctor.picture = params[:doctor][:picture]
        ret = @doctor.save
        if (ret == false)
            render :edit
        else
            redirect_to doctors_path
        end
    end
    
    def destroy
        doctor = Doctor.find(params[:id])
        doctor.destroy
        redirect_to doctors_path
    end
end
