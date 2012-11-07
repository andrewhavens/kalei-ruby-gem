$:.push File.expand_path("../lib", __FILE__)

require "kalei"

Gem::Specification.new do |s|
  s.name        = "kalei"
  s.version     = Kalei::VERSION
  s.authors     = ["Andrew Havens", "Thomas Davis"]
  s.email       = ["email@andrewhavens.com"]
  s.homepage    = "https://github.com/andrewhavens/kalei-ruby-gem"
  s.summary     = "Provides the Kalei style guide as a Rack mountable Ruby application."
  s.description = "Provides the Kalei style guide as a Rack mountable Ruby application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  # s.add_dependency 'rails'
  s.add_dependency 'sinatra'
end
