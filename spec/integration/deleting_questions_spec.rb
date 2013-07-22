require 'spec_helper'

feature "Deleting questions" do
  scenario "Deleting a question" do
    Factory(:question, topic: "Animal Kingdom")
    visit "/"
    click_link "Animal Kingdom"
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

    visit "/"
    page.should_not have_content("Animal Kingdom")
  end
end
