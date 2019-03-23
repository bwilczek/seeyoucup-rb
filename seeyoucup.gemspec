# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name         = 'seeyoucup'
  s.version      = '0.0.1'
  s.author       = 'Bartek Wilczek'
  s.email        = 'bwilczek@gmail.com'
  s.homepage     = 'https://github.com/bwilczek/seeyoucup-rb'
  s.summary      = 'A library to work with SeeYou CUP files '
  s.files        = Dir['README.md', 'lib/**/*.rb']
  s.require_path = 'lib'
  s.license      = 'MIT'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
