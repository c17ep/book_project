require 'nokogiri'
require 'open-uri'

class ScrapeLibrary

	def initialize
		@ql_nokogiri = Nokogiri::HTML(open("http://www.queenslibrary.org/books/fiction-best-sellers"))
	end

	def get_all_books
		titles = @ql_nokogiri.css("div.q-target h3").collect { |t| t.text }
		authors = @ql_nokogiri.css("div.q-target div.grid-author a").collect { |a| a.text }
		images = @ql_nokogiri.css("div.q-target img").collect { |i| i }
		info = Array.new(titles.length) { Hash.new }
		x = 0
		while x < titles.length do
			info[x][:title] = titles[x]
			info[x][:author] = authors[x]
			info[x][:image] = images[x]
			x += 1
		end
		info
	end

end