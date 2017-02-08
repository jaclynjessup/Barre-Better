class Instructor < ApplicationRecord
  has_many :trainings
  validates :full_name, presence: true
  validates :bio, presence: true

  mount_uploader :avatar, AvatarUploader
end
