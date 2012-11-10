require 'sinatra/base'

module Kalei
	class App < Sinatra::Base
		get '/' do
			erb :index
		end
		get '/css/styles.css' do
			erb :styles
		end
	end
end