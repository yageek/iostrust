# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iostrust/version'

Gem::Specification.new do |spec|
  spec.name          = "iostrust"
  spec.version       = Iostrust::VERSION
  spec.authors       = ["Yannick heinrich"]
  spec.email         = ["yannick.heinrich@gmail.com"]

  spec.summary       = "Add certificates in the trust store of the ios simulators"
  spec.description   = %(
   iostrust installs a list of certificates in all the simulators located on your computer.
   It uses sqlite and openssl from the Ruby stdlib.)
  spec.homepage      = "https://github.com/yageek/iostrust"

  spec.files         = %w{ README.md LICENSE} + Dir["lib/**/*.rb"]
  spec.executables   = "iostrust"
  spec.require_paths = ["lib"]

  spec.add_dependency "commander", "~> 4.3"
  spec.add_dependency "sqlite3"
end
