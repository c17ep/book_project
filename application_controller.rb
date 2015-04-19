require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

	get '/' do
		erb :index
	end

	get '/randombook' do
		erb :randombook
	end

end