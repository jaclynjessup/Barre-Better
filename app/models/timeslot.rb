class Timeslot < ApplicationRecord
  has_many :trainings
  validates :start_time, presence: true
  validates :end_time, presence: true
end
