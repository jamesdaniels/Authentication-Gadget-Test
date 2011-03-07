class UserSession < ActiveRecord::Base

	set_primary_key :access_token

	before_create :intialize_access_token, :initialize_expires_at

	belongs_to :user

	attr_accessor :login
	attr_accessor :password

	before_validation :find_user

	validates :login,    :presence => true, :on => :create
	validates :password, :presence => true, :password_match => true, :on => :create
	validates :user,     :presence => true, :associated => true

private

	def find_user
		self.user ||= User.where(:login => login.downcase).first
	end

	def intialize_access_token
		self.access_token = UUIDTools::UUID.random_create().to_s
	end

	def initialize_expires_at
		self.expires_at = 2.weeks.from_now
	end

end
