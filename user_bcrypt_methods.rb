def password
		self.password ||= BCrypt::Password.new(hashed_password)
	end

	def password=(new_password)
    @raw_password = new_password
		@password = BCrypt::Password.create(new_password)
		self.hashed_password = @password
	end

	def authenticate?(password_text)
		BCrypt::Password.new(self.hashed_password) == password_text
	end