class StudentsController < ApplicationController
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
        @courses = Course.all
    end
    
    def create
        student = Student.new
        student1 = params[:student]
        student.first_name = student1[:first_name]
        student.last_name = student1[:last_name]
        student.picture = student1[:picture]
        student.course_id = student1[:course_id]
        student.save
        redirect_to students_path
    end
    
    def edit
        @student = Student.find(params[:id])
        @courses = Course.all
    end
    
    def update
        student = Student.find(params[:id])
        student1 = params[:student]
        student.first_name = student1[:first_name]
        student.last_name = student1[:last_name]
        student.picture = student1[:picture]
        student.course_id = student1[:course_id]
        student.save
        redirect_to students_path
    end
    
    def destroy
        student = Student.find(params[:id])
        student.destroy
        redirect_to students_path
    end
end
