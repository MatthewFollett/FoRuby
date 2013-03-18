class UsersAddUserLevel < ActiveRecord::Migration
  def up
		add_column :users, :user_level, :integer
  end

  def down
		remove_column :users, :user_level
  end
end
