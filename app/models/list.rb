class List < ApplicationRecord
  belongs_to :user
  has_many :markers, dependent: :destroy
  has_many :places, through: :markers
  validates :title, presence: true
end
