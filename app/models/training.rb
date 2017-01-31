class Training < ApplicationRecord
  belongs_to :timeslot
  belongs_to :instructor

  has_many :user_histories
  has_many :users, through: :user_history

  validates :name, presence: true
  validates :timeslot, presence: true
  validates :date, presence: true
  validates :instructor, presence: true
end
