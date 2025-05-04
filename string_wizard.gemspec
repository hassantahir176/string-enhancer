Gem::Specification.new do |spec|
  spec.name          = "string_wizard"
  spec.version       = "0.1.0"
  spec.authors       = ["Hassan Tahir"]
  spec.email         = ["hassantahirjaura@gmail.com"]

  spec.summary       = "A magical collection of string manipulation and validation methods"
  spec.description   = "Provides a wizard's toolkit of string manipulation methods that aren't available in Ruby's standard library"
  spec.homepage      = "https://github.com/hassantahir176/string_wizard"
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