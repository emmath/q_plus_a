require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, topic: "Geography")
    visit '/'
    click_link "Geography"
    click_link "New Answer"
  end

  scenario "Creating an answer" do
    fill_in "Response", with: "Mt. Everest"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
  end

  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Response can't be blank")
  end
end
