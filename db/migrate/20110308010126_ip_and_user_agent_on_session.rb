class IpAndUserAgentOnSession < ActiveRecord::Migration
	def self.up
		add_column :user_sessions, :ip_address,       :string
		add_column :user_sessions, :user_agent,       :string
		add_column :user_sessions, :location,         :string
		add_column :user_sessions, :last_accessed_on, :datetime
	end

	def self.down
		remove_column :user_sessions, :ip_address
		remove_column :user_sessions, :user_agent
		remove_column :user_sessions, :location
		remove_column :user_sessions, :last_accessed_on
	end
end
