class PasswordMatchValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		if record.user
			record.errors[attribute] << (options[:message] || 'does not match records') unless record.user.password_match?(value)
		end
	end
end
