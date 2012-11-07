require 'kalei/app'

module Kalei

  # class RackApp
  # 	def self.call(env)
  # 		app.call(env)
  # 	end

  # 	def self.app
  # 		@@app ||= Rack::Builder.app do
    
	 #      use Rack::Static, 
	 #        # :urls => ["/css", "/js"],
	 #        :root => File.expand_path('source', File.dirname(__FILE__)),
	 #        :index => 'index.html'

	 #      run lambda { |env|
	 #      	# binding.pry
	 #       #  [
	 #       #    200, 
	 #       #    {
	 #       #      'Content-Type'  => 'text/html', 
	 #       #      'Cache-Control' => 'public, max-age=86400' 
	 #       #    },
	 #       #    File.open('source/index.html', File::RDONLY)
	 #       #  ]
	 #       [404, {'Content-Type' => 'text/html'}, ['prolly shouldnt be here']]
	 #      }
	 #    end
  # 	end
  # end

  class Engine < ::Rails::Engine
    #endpoint App #Rack::Directory.new("source")
  #   app = proc do |env|
  #   	source = File.expand_path 'source', File.dirname(__FILE__)
		#   Rack::File.new(source).call(env)
		# end
		# endpoint app

    # endpoint Rack::File.new(File.expand_path 'source', File.dirname(__FILE__))

    # app = Rack::Builder.app do
    
    #   use Rack::Static, 
    #     :urls => ["/stylesheets", "/images"],
    #     :root => "source",
    #     :index => "source/index.html"

    #   run lambda { |env|
    #     [
    #       200, 
    #       {
    #         'Content-Type'  => 'text/html', 
    #         'Cache-Control' => 'public, max-age=86400' 
    #       },
    #       File.open('source/index.html', File::RDONLY)
    #     ]
    #   }

    # end

    endpoint Kalei::App
  end

end
