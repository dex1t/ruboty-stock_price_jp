# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/stock_price_jp/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-stock_price_jp"
  spec.version       = Ruboty::StockPriceJp::VERSION
  spec.authors       = ["dex1t"]
  spec.email         = ["dex1t@degoo.org"]

  spec.summary       = %q{Ruboty plugin to fetch kabuka}
  spec.description   = %q{Ruboty plugin to fetch kabuka}
  spec.homepage      = "https://github.com/dex1t/ruboty-stock_price_jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jpstock", "~> 0.6.7"
  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
