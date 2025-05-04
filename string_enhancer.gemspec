Gem::Specification.new do |spec|
  spec.name          = "string_enhancer"
  spec.version       = StringEnhancer::VERSION
  spec.authors       = ["Hassan Tahir"]
  spec.email         = ["hassantahirjaura@gmail.com"]

  spec.summary       = "A collection of useful string manipulation methods"
  spec.description   = "Provides additional string manipulation methods that aren't available in Ruby's standard library"
  spec.homepage      = "https://github.com/hassantahir176/string_enhancer"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "nokogiri", "~> 1.10"
  spec.add_runtime_dependency "json", "~> 2.3"
  spec.add_runtime_dependency "date", "~> 3.0"
end