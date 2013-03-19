class MessageThread < ActiveRecord::Base
	belongs_to :forum
	belongs_to :author, class_name: 'User'
	
	has_many :message_posts, dependent: :destroy
	
	default_scope order: 'message_threads.created_at DESC'
end
