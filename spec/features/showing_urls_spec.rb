require 'spec_helper'

feature 'Listing Urls' do
  scenario 'List only shows active urls' do
    Url.create!(original_url: 'http://livingsocial.com', active: true)
    Url.create!(original_url: 'http://microsoft.com', active: false)

    visit '/'

    expect(page).to have_content('http://livingsocial.com')
    expect(page).to_not have_content('http://microsoft.com')

  end
end