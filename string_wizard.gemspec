require_relative "lib/string_wizard/version"

Gem::Specification.new do |spec|
  spec.name          = "string_wizard"
  spec.version       = StringWizard::VERSION
  spec.authors       = ["Hassan Tahir"]
  spec.email         = ["hassantahirjaura@gmail.com"]

  spec.summary       = "A magical collection of string manipulation and validation methods"
  spec.description   = "Provides a wizard's toolkit of string manipulation methods that aren't available in Ruby's standard library"
  spec.homepage      = "https://rubygems.org/gems/string_wizard"
  spec.metadata      = {
    "source_code_uri" => "https://github.com/hassantahir176/string-wizard"
  }
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