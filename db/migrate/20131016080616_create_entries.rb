class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.text :title
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
