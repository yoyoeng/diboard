class Tag < ApplicationRecord
  belongs_to :movie
  has_many :voted_users, through: :votes, source: :user
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  
end
