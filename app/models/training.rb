class Training < ApplicationRecord
  belongs_to :user
  belongs_to :timeslot

  has_many :user_histories
  has_many :users, through: :user_history

  validates :name, presence: true
  validates :timeslot, presence: true
  validates :date, presence: true
  validates :instructor_id, presence: true
end
