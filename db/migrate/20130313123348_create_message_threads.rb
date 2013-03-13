class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.string :title
      t.integer :author_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
