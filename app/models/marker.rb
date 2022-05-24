class Marker < ApplicationRecord
  belongs_to :place
  belongs_to :list
  # validates :
end
