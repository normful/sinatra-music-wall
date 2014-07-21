class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates :review_text, presence: true
end
