class Forum < ActiveRecord::Base
	has_many :message_threads, dependent: :destroy
end
