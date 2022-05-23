class Place < ApplicationRecord
  has_many :reviews, :markers, :photos, dependent: :destroy
end
