class Photo < ApplicationRecord
  belongs_to :place, dependent: :destroy
  belongs_to :user
  has_one :meta_data
  has_one_attached :photo
end
