require 'rails_helper'

RSpec.feature "Dishes", type: :feature do
  it "should create a dish" do
    visit '/dishes'
    click_on 'New'
    fill_in 'Name', with: 'Hot Dog'
    fill_in 'Description', with: 'Includes two tasty hot dogs'
    fill_in 'Picture', with: 'https://article.images.consumerreports.org/prod/content/dam/CRO%20Images%202018/Health/July/CR-Health-InlineHero-Healthy-HotDogs-07-18'
    fill_in 'Price', with: '1.99'
    click_on 'save'
    
    # checking database
    dish = Dish.first
    expect(dish.name).to eq('Hot Dog')
    
    # check for text on page
    expect(page).to have_content('two tasty hot dogs')
  end
  
  it "should update dish" do
    dish = Dish.create(
      name: 'Awesome Ht Dog',
      description: 'best hot dog in town',
      price: 1.99,
      picture: 'https://article.images.consumerreports.org/prod/content/dam/CRO%20Images%202018/Health/July/CR-Health-InlineHero-Healthy-HotDogs-07-18'
    )
    
    visit '/dishes'
    click_on 'Edit'
    fill_in 'Name', with: 'Awesome Hot Dog'
    click_on 'save'
    
    dish.reload
    expect(dish.name).to eq("Awesome Hot Dog")
  end
end