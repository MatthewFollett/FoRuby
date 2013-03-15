class ChangeMessagePostThreadIdToMessageThreadId < ActiveRecord::Migration
  def up
		rename_column :message_posts, :thread_id, :message_thread_id
  end

  def down
		rename_column :message_posts, :message_thread_id, :thread_id
  end
end
