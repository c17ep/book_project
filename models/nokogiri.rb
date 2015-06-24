require 'nokogiri'
require 'mechanize'
require 'open-uri'

class ScrapeLibrary

	def initialize
		@p = 0
		@ql_nokogiri = Nokogiri::HTML(open("http://www.queenslibrary.org/books/fiction-best-sellers?page=#{@p}"))
	end

	def get_all_books
		titles = []
		authors = []
		images = []
		info = []
		while @p < 9
			@ql_nokogiri = Nokogiri::HTML(open("http://www.queenslibrary.org/books/fiction-best-sellers?page=#{@p}"))
			titles << (@ql_nokogiri.css("div.q-target h3").collect { |t| t.text })
			authors << (@ql_nokogiri.css("div.q-target div.grid-author a").collect { |a| a.text }.map do |au|
				au.split(",")[0..1].reverse.join(" ")
			end)
			images << (@ql_nokogiri.css("div#content-wrapper div.q-target img").collect { |i| i })
			@p += 1
		end
		titles.flatten!
		authors.flatten!
		images.flatten!
		x = 0
		while x < titles.length do
				info << Hash.new
				info[x][:title] = titles[x]
				info[x][:author] = authors[x]
				info[x][:image] = images[x]
				x += 1
			end
		@p = 0
		info
	end

end