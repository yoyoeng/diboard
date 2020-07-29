class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :voted_tags, through: :votes, source: :tag
  has_many :votes, dependent: :destroy
  has_many :tags, through: :votes
  

  
  
end