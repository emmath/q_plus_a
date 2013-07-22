require 'spec_helper'

feature 'Creating Questions' do
  before do
    visit '/'
    click_link 'New Question'
  end

  scenario "can create a question" do
    fill_in 'Topic', :with => 'Animal Kingdom'
    fill_in 'Description', :with => "A question pertaining to animals"
    click_button 'Create Question'
    page.should have_content('Question has been created.')

    question = Question.find_by_topic("Animal Kingdom")
    page.current_url.should == question_url(question)
    title = "Animal Kingdom - Questions - Q_Plus_A"
    find("title").should have_content(title)
  end

  scenario "can not create a question without a topic" do
    click_button 'Create Question'
    page.should have_content("Question has not been created.")
    page.should have_content("Topic can't be blank")
  end
end
