class CreateMessageThreadRelationships < ActiveRecord::Migration
  def change
    create_table :message_thread_relationships do |t|
      t.integer :author_id
      t.integer :message_thread_id
			
      t.timestamps
    end
		
		add_index :message_thread_relationships, :author_id
		add_index :message_thread_relationships, :message_thread_id
		
  end
end
