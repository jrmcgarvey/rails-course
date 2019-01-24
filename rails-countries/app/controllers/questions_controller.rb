class QuestionsController < ApplicationController
#get '/questions' do
    def index
        @questions = Question.all
    end

#post '/questions' do
    def create
        question=Question.new
        question.question=params[:question]
        question.answer=params[:answer]
        question.flag=params[:flag]
        question.save
        redirect_to '/questions'
    end

#post '/questions/edit' do
    def edit_info
        question=Question.find(params[:id].to_i)
        question.question=params[:question]
        question.answer=params[:answer]
        question.flag=params[:flag]
        question.save
        redirect_to '/questions'
    end

#get '/questions/new' do
    def new
    end

#get '/questions/edit' do
    def edit
        @question_id=params[:id]
    end

#get '/' do

#get '/guess' do
    def guess
        questions=Question.all
        @question=questions.sample
    end

#get '/answer' do
    def answer
        @question=Question.find(params[:id].to_i)
    end
end
