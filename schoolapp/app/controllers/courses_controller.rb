class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    
    def new
        @course = Course.new
    end
    
    def create
        course=Course.new()
        course1=params[:course]
        course.name=course1[:name]
        course.location=course1[:location]
        course.description=course1[:description]
        course.save
        redirect_to courses_path
    end
    
    def show
        @course = Course.find(params[:id])
    end
    
    def edit
        @course = Course.find(params[:id])
    end
    
    def update
        course = Course.find(params[:id])
        course1=params[:course]
        # course.update(course1)
        course.name=course1[:name]
        course.location=course1[:location]
        course.description=course1[:description]
        course.save
        redirect_to courses_path
    end
end
