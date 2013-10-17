class CreateUnreadEntries < ActiveRecord::Migration
  def change
    create_table :unread_entries do |t|
      t.integer :entry_id
      t.integer :feed_id
      t.integer :user_id

      t.timestamps
    end
  end
end
