class MessagePostsAddAuthor < ActiveRecord::Migration
  def up
		add_column :message_posts, :author_id, :integer
  end

  def down
		remove_column :message_posts, :author_id
  end
end
