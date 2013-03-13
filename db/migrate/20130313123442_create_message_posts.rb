class CreateMessagePosts < ActiveRecord::Migration
  def change
    create_table :message_posts do |t|
      t.string :content
      t.integer :thread_id

      t.timestamps
    end
  end
end
