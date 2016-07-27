require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('adding a new store', {:type => :feature}) do
  it 'allows user to add a new store to network' do
    visit('/')
    fill_in('new_store', :with => 'getamax')
    click_button('Add New Store')
    expect(page).to have_content('Getamax')
  end
end

describe('update a store', {:type => :feature}) do
  it 'allows user to update a store' do
    visit('/')
    fill_in("new_store", :with => 'getamax')
    click_button('Add New Store')
    expect(page).to have_content('Getamax')
    click_link('Getamax')
    fill_in("store_name", :with => 'shoe stack')
    click_button('Edit')
    expect(page).to have_content('Shoe stack')
  end
end

describe('delete a store', {:type => :feature}) do
  it('allows user to delete a store') do
    visit('/')
    fill_in("new_store", :with => 'chuckers')
    click_button('Add New Store')
    expect(page).to have_content('Chuckers')
    click_link('Chuckers')
    click_button('Delete')
    expect(page).to have_content('Track Shoes')
  end
end
