require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  it 'should create dish' do
    post :create, params: { dish: { name: 'Hot Dog', description: 'good hots dogs', price: 1.99, picture: 'img' } }
    
    dish = Dish.first
    expect(dish.name).to eq('Hot Dog')
  end
  
  it 'should update dish' do
    dish = Dish.create(
      name: 'Awesome Ht Dog',
      description: 'best hot dog in town',
      price: 1.99,
      picture: 'test'
    )
    
    dish_params = { 
      name: 'Awesome Hot Dog', 
      description: 'bet hot dog in town', 
      price: 1.99, 
      picture: 'test'
    } 
    
    put :update, params: { dish: dish_params, id: dish.id }
    
    dish.reload
    
    expect(dish.name).to eq("Awesome Hot Dog")
  end
end