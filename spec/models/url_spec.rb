require 'spec_helper'

describe Url do
  describe "validations" do
    before do
      @url = Url.new(original_url: 'http://google.com')
      expect(@url).to be_valid
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

end