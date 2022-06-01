class User < ApplicationRecord
  acts_as_voter
  has_many :reviews
  has_many :photos
  has_many :lists, dependent: :destroy
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def admin?
  #   admin
  # end
end
