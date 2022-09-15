# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "bai2"
  spec.version = "2.0.1"
  spec.authors = ["Kenneth Ballenegger"]
  spec.email = ["kenneth@ballenegger.com"]
  spec.summary = "Parse BAI2 files."
  spec.description = "Parse BAI2 files."
  spec.homepage = "https://github.com/venturehacks/bai2"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "standard"
end
