class Photo < ApplicationRecord
  belongs_to :place, dependent: :destroy
  belongs_to :user
  has_many :meta_data
end
