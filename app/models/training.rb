class Training < ApplicationRecord
  belongs_to :timeslot
  belongs_to :instructor
  belongs_to :barre_type

  has_many :user_histories
  has_many :users, through: :user_histories

  validates :barre_type, presence: true
  validates :timeslot, presence: true
  validates :date, presence: true
  validates :instructor, presence: true
end
