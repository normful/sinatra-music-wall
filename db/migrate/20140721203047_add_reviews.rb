class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.string :review_text
      t.timestamps
    end
  end
end
