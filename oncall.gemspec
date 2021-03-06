require File.join(File.dirname(__FILE__), 'lib', 'oncall', 'version')

Gem::Specification.new do |s|
  s.name         = 'oncall'
  s.version      = Oncall::VERSION
  s.license      = 'MIT'
  s.summary      = "BDD for JSON API's"
  s.description  = "BDD for JSON API's"
  s.authors      = ['Koen Woortman']
  s.email        = 'koensw@outlook.com'
  s.homepage     = 'https://github.com/koenwoortman/oncall'
  s.metadata     = {
    'bug_tracker_uri' => 'https://github.com/koenwoortman/oncall/issues'
  }

  s.executables  = ['oncall']
  s.require_path = 'lib'
  s.files        = Dir[
    'LICENSE',
    'README.md',
    'lib/**/*'
  ]

  s.required_ruby_version = '>= 2.3'

  s.add_dependency 'colorize', '0.8.1'
  s.add_dependency 'json-schema', '2.8.1'

  s.add_development_dependency 'json', '2.2.0'
  s.add_development_dependency 'rspec', '3.9.0'
  s.add_development_dependency 'sinatra', '2.0.7'
end
