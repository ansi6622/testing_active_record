require 'spec_helper'

feature 'URL shortening' do
  scenario 'Allows user to shorten a URL' do
    visit '/'
    click_link 'Shorten Url'

    fill_in 'url[original_url]', with: 'http://livingsocial.com'
    click_on 'Shorten'

    within('ul') do
      expect(page).to have_content "http://livingsocial.com"
    end
  end

  scenario 'Reports an error when user tries to shorten a non-url' do
    visit '/'
    click_link 'Shorten Url'

    fill_in 'url[original_url]', with: 'not a url'
    click_on 'Shorten'

    expect(page).to have_content 'Original url is not a valid URL'
  end

  scenario 'Reports an error when user tries to shorten a blank url' do
    visit '/'
    click_link 'Shorten Url'

    click_on 'Shorten'

    expect(page).to have_content "Original url can't be blank"
  end
end