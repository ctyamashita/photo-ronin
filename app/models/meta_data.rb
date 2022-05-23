class MetaData < ApplicationRecord
  belongs_to :photo
  validates :aperture, numericality: { only_integer: true, greater_than: 0 }
  validates :shutter_speed, numericality: { only_integer: true, greater_than: 0 }
  validates :ISO, numericality: { only_integer: true, greater_than: 0 }
  # work on metadata later, after basics things
end
