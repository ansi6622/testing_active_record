require 'spec_helper'

feature 'URL shortening' do
  scenario 'Allows user to shorten a URL' do
    visit '/'

    fill_in 'url[original_url]', with: 'http://livingsocial.com'
    click_on 'Shorten'

    expect(page).to have_content 'Original URL'
    expect(page).to have_content 'http://livingsocial.com'
    expect(page).to have_content '"Shortened" URL'

    created_url = Url.last
    expect(page).to have_content "http://www.example.com:80/#{created_url.id}"
  end

  scenario 'Reports an error when user tries to shorten a non-url' do
    visit '/'

    fill_in 'url[original_url]', with: 'not a url'
    click_on 'Shorten'

    expect(page).to have_content 'The text you entered is not a valid URL'
  end

  scenario 'Reports an error when user tries to shorten a blank url' do
    visit '/'

    click_on 'Shorten'

    expect(page).to have_content "Original url can't be blank"
  end
end