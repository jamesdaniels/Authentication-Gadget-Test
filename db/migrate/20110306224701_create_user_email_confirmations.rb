class CreateUserEmailConfirmations < ActiveRecord::Migration
	def self.up
		create_table :user_email_confirmations, :id => false do |t|
			t.references :user
			t.string     :email, :state
			t.string     :confirmation_token, :limit => 36, :primary => true
			t.timestamps
		end
	end

	def self.down
		drop_table :user_email_confirmations
	end
end
