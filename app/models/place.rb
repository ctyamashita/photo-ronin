class Place < ApplicationRecord
  has_many :markers
  has_many :lists, through: :markers
  has_many :photos
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # include PgSearch::Model
  # pg_search_scope :search_by_address_and_name,
  #                 against: %i[address name],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
  validates :address, presence: true, uniqueness: true
end
