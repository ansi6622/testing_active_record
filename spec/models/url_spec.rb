require 'spec_helper'

describe Url do
  describe "validations" do
    before do
      @url = Url.new(original_url: 'http://google.com')
      expect(@url).to be_valid
    end
    it 'is active upon creation' do
      expect(@url).to be_active
      # This is the same as the above line of code
      # expect(@url.active?).to eq(true)
    end

    it 'is inactive if it has a inactivated_on date' do
      url = Url.new(original_url: 'http://bar.com', inactivated_on: 1.day.ago)

      expect(url).to_not be_active
    end

    it 'must have an original url' do
      @url.original_url = ''

      expect(@url).to_not be_valid
      # This is the same as the above line of code
      # expect(url.valid?).to eq true
    end

    it 'must have a valid url' do
      @url.original_url = 'google.com'

      expect(@url).to_not be_valid
    end

    it 'allows https urls to be valid' do
      url = Url.new(original_url: 'https://google.com')

      expect(url).to be_valid
    end
  end

  describe 'finding acitve urls' do
    it 'only shows urls that are active' do
      living_social = Url.create!(original_url: 'http://foo.com', active: true)
      Url.create!(original_url: 'http://bar.com', active: false)

      expect(Url.active).to match_array [living_social]
    end
  end

  describe 'can caluclate a shortened_identifier' do
    it 'returns the id of the url' do
      url = Url.create!(original_url: 'http://foo.com')

      expect(url.shortened_identifier).to eq(url.id * 1000)
    end
  end
end