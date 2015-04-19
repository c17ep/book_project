class User
	attr_accessor :email, :password, :liked_books, :disliked_books, :library, :age

	def initialize(email, password, library)
		@email = email
		@password = password
		@library = library
	end

end