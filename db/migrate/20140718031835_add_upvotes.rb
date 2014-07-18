class AddUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.timestamps
    end
  end
end
