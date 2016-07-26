require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new shoe', {:type => :feature}) do
  it 'adds a new shoe to inventory' do
    visit('/')
    fill_in('new_shoe', :with => 'brackets')
    click_button('Add New Shoe')
    expect(page).to have_content('Brackets')
  end
end
