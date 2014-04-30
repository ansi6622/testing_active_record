class Url < ActiveRecord::Base
  validates :original_url, presence: true

  validates :original_url,
            format: {
                with: URI::regexp(%w(http https)),
                message: "is not a valid URL"
            }

  def self.active
    where(inactivated_on: nil)
  end

  def shortened_identifier
    id * 1000
  end

  def active?
    inactivated_on == nil
  end
end