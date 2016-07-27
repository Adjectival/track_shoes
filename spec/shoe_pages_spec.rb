require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('home page path', {:type => :feature}) do
  it('allows user to view the homepage') do
    visit('/')
    expect(page).to have_content('Track Shoes')
  end
end

describe('adding a new shoe', {:type => :feature}) do
  it 'allows user to add a new shoe to inventory' do
    visit('/')
    fill_in('new_shoe', :with => 'brackets')
    click_button('Add New Shoe')
    expect(page).to have_content('Brackets')
  end
end

describe('delete a shoe', {:type => :feature}) do
  it('allows user to delete a shoe') do
    visit('/')
    fill_in("new_shoe", :with => 'gems')
    click_button('Add New Shoe')
    expect(page).to have_content('Gems')
    click_link('Gems')
    click_button('Delete')
    expect(page).to have_content('Track Shoes')
  end
end
