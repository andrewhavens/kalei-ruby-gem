require 'sinatra/base'

module Kalei
	class App < Sinatra::Base
		get '/' do
			erb :index
		end
	end
end