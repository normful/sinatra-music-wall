class Song < ActiveRecord::Base
  has_many :upvotes
  has_many :users, through: :upvotes
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :url, :url => { :allow_blank => true }
end
