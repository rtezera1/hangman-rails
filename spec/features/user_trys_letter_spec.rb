require 'spec_helper'

feature 'user tries letter' do 
  scenario 'user puts a valid letter' do 
    user = FactoryGirl.create(:user)
    word = FactoryGirl.create(:word)
    game = FactoryGirl.create(:game)
    sign_in_as(user)

    visit user_root_path
    fill_in 'Letter', with: 'b'
    click_on 'check'

    expect(page).to have_content 'Correct'
  end

  scenario 'user tries invalid letter' do 
    user = FactoryGirl.create(:user)
    word = FactoryGirl.create(:word)
    game = FactoryGirl.create(:game)
    sign_in_as(user)

    visit user_root_path
    click_on 'check'

    expect(page).to have_content 'Incorrect'
  end
end

