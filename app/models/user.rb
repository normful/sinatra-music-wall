class User < ActiveRecord::Base
  has_many :songs
  has_many :upvotes
  has_many :songs, through: :upvotes
  has_many :reviews
  has_many :songs, through: :reviews
  validates :email,
    presence: true,
    uniqueness: true,
    :email_format => {:message => 'invalid email format'}
  validates :password,
    presence: true,
    length: { minimum: 8 }
end
