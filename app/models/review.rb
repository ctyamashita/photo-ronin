class Review < ApplicationRecord
  belongs_to :place
  belongs_to :user
end

CATEGORIES = ["Ruby", "JavaScript", "CSS"]
