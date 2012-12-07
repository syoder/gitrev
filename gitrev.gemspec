# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gitrev/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Yoder"]
  gem.email         = ["yodersb@gmail.com"]
  gem.description   = "makes it easy to determine which git revision is running on your server."
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gitrev"
  gem.require_paths = ["lib", "app/controllers"]
  gem.version       = Gitrev::VERSION
  gem.add_runtime_dependency(%q<capistrano>, [">= 0"])
end
