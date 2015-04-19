class Book
	attr_accessor :title, :author, :libraries

	def initialize(title, author, libraries)
		@title = title
		@author = author
		@libraries = libraries
		# NOTE: libraries should be an array
	end

end

book1 = Book.new("The Hitchikers Guide to the Galaxy", "Douglas Adams", ["North Forest Park", "Rego Park", "Jamaica"])