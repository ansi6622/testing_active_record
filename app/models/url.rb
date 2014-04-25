class Url < ActiveRecord::Base
  validates :original_url, presence: true

  validates :original_url,
            format: {
                with: URI::regexp(%w(http https)),
                message: "The text you entered is not a valid URL"
            }
end