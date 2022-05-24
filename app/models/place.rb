class Place < ApplicationRecord
  has_many :bookmarks
  has_many :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
