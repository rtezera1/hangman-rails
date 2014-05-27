
require 'spec_helper'

feature "user signs in" do 

  scenario "user signs in with valid credentials" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "user signs in with invalid credentials" do
    visit new_user_session_path
    click_on "Sign in"

    expect(page).to have_content "Invalid email or password."
  end
end
