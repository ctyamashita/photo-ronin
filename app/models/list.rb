class List < ApplicationRecord
  belongs_to :user
  has_many :markers, dependent: :destroy
  has_many :places, through: :markers
  has_many :photos, through: :places
  validates :title, presence: true

  def most_liked_photo
    # TODO: implement logic when likes are added
    photos.first
  end
end
