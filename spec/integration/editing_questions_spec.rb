require 'spec_helper'

feature "Editing Questions" do
  before do
    Factory(:question, :topic => "Animal Kingdom")
    visit "/"
    click_link "Animal Kingdom"
    click_link "Edit Question"
  end

  scenario "Updating a question" do
    fill_in "Topic", :with => "Animal Kingdom beta"
    click_button "Update Question"
    page.should have_content("Question has been updated.")
  end

  scenario "Updating a question with invalid attributes is bad" do
    fill_in "Topic", with: ""
    click_button "Update Question"
    page.should have_content("Question has not been updated.")
  end
end
