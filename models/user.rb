class User
	attr_accessor :email, :password, :liked_books, :disliked_books, :library, :new_book, :age

	def initialize(email, password, library)
		@email = email
		@password = password
		@library = library
		@new_book  = "The Hitchiker's Guide to the Galaxy"
		@new_book
	end

	def prompt
		@new_book
	end
end