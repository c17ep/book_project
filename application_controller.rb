require 'bundler'
require 'nokogiri'
require 'open-uri'
Bundler.require

require_relative "models/nokogiri.rb"

class MyApp < Sinatra::Base

	get '/' do
		erb :index
	end

	get '/randombook' do

		library_scraper = ScrapeLibrary.new

		@book = library_scraper.get_all_books[rand(0..library_scraper.get_all_books.length - 1)]

		erb :randombook
	
	end

end