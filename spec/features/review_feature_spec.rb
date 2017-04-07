require 'rails_helper'

feature 'reviews' do

  context 'reviewing restaurants' do

    before do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@now.com'
      fill_in 'Password', with: 'makers'
      fill_in 'Password confirmation', with: 'makers'
      click_button 'Sign up'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
    end

    scenario 'allows users to leave a review using a form' do
       visit '/restaurants'
       click_link 'Review KFC'
       fill_in "Thoughts", with: "so so"
       select '3', from: 'Rating'
       click_button 'Leave Review'

       expect(current_path).to eq '/restaurants'
       expect(page).to have_content('so so')
    end

    scenario 'Users can only leave one review per restaurant' do
       visit '/restaurants'
       click_link 'Review KFC'
       fill_in "Thoughts", with: "so so"
       select '3', from: 'Rating'
       click_button 'Leave Review'
       expect(current_path).to eq '/restaurants'
       expect(page).to have_content('so so')
       expect(page).not_to have_link('Review KFC')
    end

  end
end
