require 'spec_helper'

feature "user signs out" do

  scenario "user signs out" do
    
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on "Sign out"

    expect(page).to have_content "Signed out successfully."
  end
end
