class Song < ActiveRecord::Base
  has_many :upvotes
  has_many :users, through: :upvotes
  validates :title, presence: true
  validates :author, presence: true
  validates :url, :url => { :allow_blank => true }
end
