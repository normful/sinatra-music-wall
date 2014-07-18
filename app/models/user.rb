class User < ActiveRecord::Base
  validates :email,
    presence: true,
    :email_format => {:message => 'invalid email format'}
  validates :password,
    presence: true
end
