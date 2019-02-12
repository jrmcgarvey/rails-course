class RestaurantOrdersController < ApplicationController
    def index
        @orders = Order.where(status: ['submitted','preparing','enroute','delivering'])
    end
    
    def  prepare
        order = Order.find(params[:id])
        order.status = 'preparing'
        order.save
        redirect_to restaurant_orders_path
    end
    
    def enroute
        order = Order.find(params[:id])
        order.status = 'enroute'
        order.save
        redirect_to restaurant_orders_path
    end
    
    def deliver
        order = Order.find(params[:id])
        order.status = 'delivering'
        order.save
        redirect_to restaurant_orders_path
    end
    
    def complete
        order = Order.find(params[:id])
        order.status = 'complete'
        order.save
        redirect_to restaurant_orders_path
    end
end
