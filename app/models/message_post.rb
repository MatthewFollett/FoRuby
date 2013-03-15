require 'message_thread'
class MessagePost < ActiveRecord::Base
	attr_accessible :content, :author_id, :message_thread_id
	belongs_to :author, class_name: 'User'
	belongs_to :message_thread
	
  validates :author_id, presence: true 
	validates :content, presence: true
end
