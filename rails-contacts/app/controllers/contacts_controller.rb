class ContactsController < ApplicationController
    
#get '/contacts' do
    def index
        if (params[:search]==nil)
            @contacts=Contact.all
        else
            searcharg="%" + params[:search] + "%"
            @contacts=Contact.where("first_name LIKE ? OR last_name LIKE ?",searcharg,searcharg)
        end
    end

#post '/contacts' do
    def create
        contact=Contact.new
        contact.first_name=params[:first_name]
        contact.last_name=params[:last_name]
        contact.phone=params[:phone]
        contact.email=params[:email]
        contact.address=params[:address]
        contact.city=params[:city]
        contact.state=params[:state]
        contact.zip=params[:zip]
        contact.save
        redirect_to '/contacts'
    end

#post '/contacts/edit' do
    def update
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
        redirect_to '/contacts'
    end

#get '/contacts/new' do
    def new
    end

#get '/contacts/edit' do
    def edit
        @contact=Contact.find(params[:id])
    end

end
