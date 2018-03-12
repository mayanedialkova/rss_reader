require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'click on the link for creating new feed' do

    before(:each) do
      visit '/'
    end

    scenario 'should be successful' do
      click_link 'click here'

      expect(current_path).to eql('/feeds/new')
      expect(page).to have_content 'New Feed'
    end
  end
end
