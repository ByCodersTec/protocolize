$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'protocolize/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'protocolize'
  spec.version     = Protocolize::VERSION
  spec.authors     = ['Brena Monteiro']
  spec.email       = ['brena.monteiro@bycoders.com.br']
  spec.homepage    = ''
  spec.summary     = ''
  spec.description = ''
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency 'rails', '~> 6.0.3', '>= 6.0.3.3'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'simplecov'
end
