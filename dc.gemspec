$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dc"
  s.version     = Dc::VERSION
  s.authors     = ["Leonid Medovyy"]
  s.email       = ["leonid.medovyy@radiant9.com"]
  s.homepage    = 'http://www.radiant9.com/dc'
  s.summary     = 'Framework for meta application development'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  s.add_development_dependency "sqlite3"
end
