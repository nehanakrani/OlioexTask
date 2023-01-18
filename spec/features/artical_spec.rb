require "rails_helper"
require "pry"

RSpec.describe "Artical", :type => :feature do
  scenario 'User visits articles listing page' do
    visit root_path
    expect(page).to have_content 'Articles List'
    expect(page).to have_content 'Ambipur air freshener plugin'
    expect(page).to have_content 'Location: Ystalyfera, United Kingdom'
    expect(page).to have_content 'Likes: 0'
  end

  scenario 'when user liked an article' do
    visit root_path
    within('.likes', match: :first) do
      expect(page).to have_content('Likes: 0')
      click_button '👍🏻'
      expect(page).to have_content('Likes: 1')
    end
  end
end
