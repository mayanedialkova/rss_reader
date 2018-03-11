class Feed < ApplicationRecord
  validates :name,
            presence: true,
            length: { in: 3..255 }
  validates :url,
            presence: true,
            length: { in: 10..255 },
            uniqueness: true,
            format: {
              with: URI.regexp(%w(http https)),
              message: 'has bad format'
            }

  paginates_per 5
end
