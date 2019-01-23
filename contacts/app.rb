require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'test.db' }

class Contact < ActiveRecord::Base
end

get '/' do
    'Hello World'
end

get '/contacts' do
    if (params[:search]==nil)
      @contacts=Contact.all
    else
      searcharg="%" + params[:search] + "%"
      @contacts=Contact.where("first_name LIKE ? OR last_name LIKE ?",searcharg,searcharg)
    end
    erb :contacts
end

post '/contacts' do
    contact=Contact.new(params)
    contact.save
    redirect '/contacts'
end

post '/contacts/edit' do
    contact=Contact.find(params[:id].to_i)
    contact.first_name=params[:first_name]
    contact.last_name=params[:last_name]
    contact.phone=params[:phone]
    contact.email=params[:email]
    contact.address=params[:address]
    contact.city=params[:city]
    contact.state=params[:state]
    contact.zip=params[:zip]
    contact.save
    redirect '/contacts'
end

get '/contacts/new' do
    erb :new
end

get '/contacts/edit' do
    @contact=Contact.find(params[:id])
    erb :edit
end
