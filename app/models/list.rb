class List < ApplicationRecord
  belongs_to :user
  has_many :markers, dependent: :destroy
  validates :title, presence: true
end
