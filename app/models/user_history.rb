class UserHistory < ApplicationRecord
  belongs_to :user
  belongs_to :training

  validates :user, presence: true, uniqueness: { scope: [:training] }
  validates :training, presence: true
end
