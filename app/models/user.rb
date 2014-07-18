class User < ActiveRecord::Base
  has_many :upvotes
  has_many :songs, through: :upvotes
  validates :email,
    presence: true,
    uniqueness: true,
    :email_format => {:message => 'invalid email format'}
  validates :password,
    presence: true,
    length: { minimum: 8 }
end
