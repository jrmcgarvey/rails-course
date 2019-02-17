require 'rails_helper'

RSpec.describe Order, type: :model do
  it "should calculate total" do
    # setup code
    user = User.create(email: 'bob@gmail.com', password: 'test123')
    dish = Dish.create(
      name: 'Hot Dog',
      description: 'Basic',
      price: 1.99,
      picture: 'test'
    )
    order = Order.create(
      user_id: user.id,
      street_address: '123 pine st.',
      city: 'raleigh',
      state: 'NC',
      zip: '12345',
      status: 'open'
    )
    OrderDish.create(
      dish_id: dish.id,
      order_id: order.id
    )
    
    
    # test code
    order = Order.first
    expect(order.total).to eq(1.99)
  end
end