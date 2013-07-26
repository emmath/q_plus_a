require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, topic: "Geography")
    user = Factory(:user, email: "ticketee@example.com")

    visit '/'
    click_link "Geography"
    click_link "New Answer"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", with: "ticketee@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Answer") }
  end

  scenario "Creating an answer" do
    fill_in "Response", with: "Mt. Everest"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
  end
end
