class User < ActiveRecord::Base

	before_validation :normalize_attributes
	before_save :encrypt_password

	has_many :user_sessions,            :dependent => :destroy
	has_many :user_email_confirmations, :dependent => :destroy

	attr_accessor :password, :password_confirmation

	validates :login, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true, :email_format => true

	validates :password, :presence => true, :confirmation => true, :length => {:minimum => 6}, :on => :create

	state_machine :state, :initial => :pending do

		event :confirm do
			transition :pending => :confirmed, :invited => :confirmed
		end

		event :deactivate do
			transition :confirmed => :deactivated
		end

		state :invited, :pending

		state :confirmed

		state :deactivated

	end

	def password_match?(guess)
		BCrypt::Password.new(encrypted_password) == guess
	end

private

	def normalize_attributes
		self.login = login.downcase if login
		self.email = email.downcase if email
	end

	def encrypt_password
		self.encrypted_password = BCrypt::Password.create(password) if password
	end

end
