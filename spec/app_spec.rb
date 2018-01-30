require File.dirname(__FILE__) + '/spec_helper'

describe 'WhatMunch' do
  before(:each) do
   $munch = []
   $running_total = 0
  end
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should load the webpage' do
    get '/'
    last_response.status.should == 200
  end


  describe 'When creating a food item with a decimal value',:type => :feature do
      it 'renders the food item value correctly' do
        visit '/'
        fill_in('item-input', with: 'Pizza')
        fill_in('out-of-range-input', with: '10.5')
        click_link_or_button('Add Munch')
        within('#results-table') do
          expect(page).to have_content('Pizza')
          expect(page).to have_content('10.5')
        end

        within('#results-table h2') do
        expect(page).to have_content('10.5')
        end
    
      end
  end

  describe 'When adding two food items whose total cost have decimal values',:type => :feature do
      it 'renders the food item value correctly' do
        visit '/'
        fill_in('item-input', with: 'Pizza')
        fill_in('out-of-range-input', with: '10.5')
        click_link_or_button('Add Munch')

        fill_in('item-input', with: 'Kebab')
        fill_in('out-of-range-input', with: '9.99')
        click_link_or_button('Add Munch')


        within('#results-table h2') do
          expect(page).to have_content(/20.49$/)
        end
      end
    end
end