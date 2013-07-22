require 'spec_helper'

feature "Viewing questions" do
  scenario "Listing all questions" do
    question = Factory.create(:question, topic: "Animal Kingdom")
    visit '/'
    click_link 'Animal Kingdom'
    page.current_url.should == question_url(question)
  end
end
