# -*- encoding: utf-8 -*-
require File.expand_path('../lib/supportbee/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sandip Ransing"]
  gem.email         = ["sandip@joshsoftware.com"]
  gem.description   = %q{CLI for supportbee API}
  gem.summary       = %q{Gem will allow you to fetch tickets based on organization and assigned user, etc..}
  gem.homepage      = "http://github.com/punerb/supportbee"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "supportbee"
  gem.require_paths = ["lib"]
  gem.version       = Supportbee::VERSION

  gem.add_dependency "httparty"
end
