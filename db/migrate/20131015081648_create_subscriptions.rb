class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :feed_id
      t.integer :unread_count

      t.timestamps
    end
  end
end
