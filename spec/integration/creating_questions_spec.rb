require 'spec_helper'

feature 'Creating Questions' do
  scenario "can create a question" do
    visit '/'
    click_link 'New Question'
    fill_in 'Topic', :with => 'Animal Kingdom'
    fill_in 'Description', :with => "A question pertaining to animals"
    click_button 'Create Question'
    page.should have_content('Question has been created.')
  end
end
