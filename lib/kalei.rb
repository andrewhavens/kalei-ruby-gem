require 'kalei/app'

module Kalei
	VERSION = "0.0.1"

	def self.stylesheets=(array)
		@@stylesheets = array
	end

	def self.stylesheets
		@@stylesheets ||= []
	end

end
