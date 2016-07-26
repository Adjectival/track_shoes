require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it 'adds a new store to network' do
    visit('/')
    fill_in('new_store', :with => 'getamax')
    click_button('Add New Store')
    expect(page).to have_content('Getamax')
  end
end
