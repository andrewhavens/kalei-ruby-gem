$:.push File.expand_path("../lib", __FILE__)

require "kalei/version"

Gem::Specification.new do |s|
  s.name        = "kalei"
  s.version     = Kalei::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Kalei."
  s.description = "TODO: Description of Kalei."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails'
  s.add_dependency 'sinatra'
end
