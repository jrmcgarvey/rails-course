class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @orders = Order.all.where(user_id: current_user.id)
    end
    
    def show
    end
    
    def new
        @order = Order.new
    end
    
    def create
        order = Order.new
        order.user_id = current_user.id
        order.street_address = params[:order][:street_address]
        order.city = params[:order][:city]
        order.state = params[:order][:state]
        order.zip = params[:order][:zip]
        order.status = 'created'
        order.save
        redirect_to prepare_order_path(order)
    end
    
    def prepare
        @order = Order.find(params[:id])
        @dishes = Dish.all
        @total = 0
        @order.dishes.each do |dish|
            @total = @total + dish.price
        end
    end
    
    def add
        order = Order.find(params[:id])
        order_dish = OrderDish.new
        order_dish.order_id = params[:id]
        order_dish.dish_id = params[:dish_id]
        order_dish.save
        redirect_to prepare_order_path(order)
    end
    
    def remove
        order = Order.find(params[:id])
        order_dish = OrderDish.find(params[:order_dish_id])
        order_dish.destroy
        redirect_to prepare_order_path(order)
    end
    
    def submit
        order = Order.find(params[:id])
        order.status = 'submitted'
        order.save
        redirect_to orders_path
    end
end
