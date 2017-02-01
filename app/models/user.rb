class User < ApplicationRecord
  has_many :user_histories
  has_many :trainings, through: :user_histories

  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 6..20 }
  validates :role, acceptance: { accept: ['client', 'instructor', 'admin'] }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
