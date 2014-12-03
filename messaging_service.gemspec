# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messaging_service/version'

Gem::Specification.new do |spec|
  spec.name          = "messaging_service"
  spec.version       = MessagingService::VERSION
  spec.authors       = ["Ashish Singh"]
  spec.email         = ["aitashish173@gmail.com"]
  spec.summary       = %q{Handles messaging part for main app}
  spec.description   = %q{Logic for handling request for messaged b/w users}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

end
