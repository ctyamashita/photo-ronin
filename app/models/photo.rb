class Photo < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_one :meta_data, dependent: :destroy
  has_one_attached :photo

  def geocode
    [self.latitude, self.longitude]
  end
end
