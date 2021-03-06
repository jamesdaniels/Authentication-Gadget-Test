class CreateUsers < ActiveRecord::Migration
	def self.up
		create_table :users do |t|
			t.string :login, :email, :encrypted_password, :password_salt, :state
			t.timestamps
		end
	end

	def self.down
		drop_table :users
	end
end
