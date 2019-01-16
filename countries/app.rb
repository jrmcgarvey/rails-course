require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'test.db' }

class Question < ActiveRecord::Base
end

get '/questions' do
   @questions = Question.all
   erb :questions
end

post '/questions' do
    question=Question.new(params)
    question.save
    redirect '/questions'
end

post '/questions/edit' do
    q=Question.find(params[:id].to_i)
    q.question=params[:question]
    q.answer=params[:answer]
    q.flag=params[:flag]
    q.save
    redirect '/questions'
end

get '/questions/new' do
    erb :new
end

get '/questions/edit' do
    @qid=params[:id]
    erb :edit
end

get '/' do
    'Hello World'
end