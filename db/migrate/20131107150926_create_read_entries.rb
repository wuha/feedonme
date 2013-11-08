class CreateReadEntries < ActiveRecord::Migration
  def change
    create_table :read_entries do |t|
      t.integer :entry_id
      t.integer :feed_id
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
