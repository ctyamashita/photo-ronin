class Marker < ApplicationRecord
  belongs_to :list
  belongs_to :place
end
