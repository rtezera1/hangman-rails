require 'spec_helper'

feature "user signs up" do

  scenario "user signs up with valid information" do
    visit new_user_registration_path

    fill_in "Email", with: "r4eth@yahoo.com"
    fill_in "Password", with: "new12345"
    fill_in "Password confirmation", with: "new12345"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user signs up without required information" do
    visit new_user_registration_path

    click_on "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
