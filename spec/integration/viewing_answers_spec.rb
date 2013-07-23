require 'spec_helper'

feature "Viewing answers" do
  before do
    animal_kingdom = Factory(:question, topic: "Animal Kingdom")
    Factory(:answer, question: animal_kingdom, response: "Gorillas")
    geography = Factory(:question, topic: "Geography")
    Factory(:answer, question: geography, response: "Mt. Everest")

    visit '/'
  end

  scenario "Viewing answers for a given question" do
    click_link "Animal Kingdom"
    page.should have_content("Gorillas")
    page.should_not have_content("Mt. Everest")

    click_link "Gorillas"
    within('#answer h2') do
      page.should have_content("Gorillas")
    end
  end
end
