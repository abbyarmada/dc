$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'dc/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'dc'
  s.version     = DC::VERSION
  s.authors     = ['Leonid Medovyy']
  s.email       = ['leonid.medovyy@radiant9.com']
  s.homepage    = 'http://www.radiant9.com/dc'
  s.summary     = 'Framework for meta application development'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  # Backend
  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'pg'

  # Configuration
  s.add_dependency 'config'

  # Presentation
  s.add_dependency 'slim-rails'

  # Testing
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
end
