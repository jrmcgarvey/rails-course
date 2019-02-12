class Order < ApplicationRecord
    belongs_to :user
    has_many :order_dishes
    has_many :dishes, through: :order_dishes
    
    def total
        total = 0
        dishes.each do |dish|
            total = total + dish.price
        end
        return total
    end
end
