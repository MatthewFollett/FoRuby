class User < ActiveRecord::Base
	default_scope order: 'users.name ASC'
  
	attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

	has_many :message_posts, :class_name => 'MessagePost', :foreign_key => "author_id", dependent: :destroy
	has_many :message_threads, :foreign_key => "author_id", dependent: :destroy
	
  before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
	
	def post_count
		message_posts.size
	end
	
	def is_admin?
		name == "Admin"
	end
	
	private 
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end 
end
