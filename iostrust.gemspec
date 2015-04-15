# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iostrust/version'

Gem::Specification.new do |spec|
  spec.name          = "iostrust"
  spec.version       = Iostrust::VERSION
  spec.authors       = ["Yannick heinrich"]
  spec.email         = ["yannick.heinrich@gmail.com"]

  spec.summary       = "Tool installing certificate in the trus store of the ios simulators"
  spec.description   = %(
   iostrust install a list of certificate in all the simulators located on your computer.
   It uses sqlite and openssl from the Ruby stdlib)
  spec.homepage      = "https://github.com/yageek/iostrust"

  spec.files         = %w{ README.md } + Dir["lib/**/*.rb"]
  spec.executables   = "iostrust"
  spec.require_paths = ["lib"]

  spec.add_dependency "commander", "~> 4.3"
  spec.add_dependency "sqlite3"
end
