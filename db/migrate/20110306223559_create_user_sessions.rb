class CreateUserSessions < ActiveRecord::Migration
	def self.up
		create_table :user_sessions, :id => false do |t|
			t.references :user
			t.string     :access_token, :limit => 36, :primary => true
			t.datetime   :expires_at
			t.timestamps
		end
	end

	def self.down
		drop_table :user_sessions
	end
end
