class BarreType < ApplicationRecord
  has_many :trainings
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
