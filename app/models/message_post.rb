require 'message_thread'
class MessagePost < ActiveRecord::Base
	belongs_to :author, class_name: 'User'
	belongs_to :message_thread
	
  validates :author_id, presence: true 
	validates :content, presence: true
end
