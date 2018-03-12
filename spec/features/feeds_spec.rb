require 'rails_helper'

RSpec.feature 'Feeds', type: :feature do
  context 'creating a new feed' do

    before(:each) do
      visit '/feeds'
    end

    scenario 'should be successful' do
      click_link 'New'
      expect(current_path).to eql('/feeds/new')

      within('form') do
        fill_in 'feed[name]', with: 'Cool Feed'
        fill_in 'feed[url]', with: 'http:/\/\cool_feed.com'
      end
      click_button 'Create Feed'

      expect(page).to have_content 'Feed was successfully created'
    end
  end
end