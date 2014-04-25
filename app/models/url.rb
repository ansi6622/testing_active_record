class Url < ActiveRecord::Base
  validates :original_url, presence: true

  validates :original_url,
            format: {
                with: URI::regexp(%w(http https)),
                message: "is not a valid URL"
            }

  def self.active
    where(active: true)
  end

  def shortened_identifier
    id * 100
  end
end