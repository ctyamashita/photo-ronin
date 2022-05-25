class Marker < ApplicationRecord
  belongs_to :list
  belongs_to :place

  validates :place, uniqueness: { scope: :list }
end
