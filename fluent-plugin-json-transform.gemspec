# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-json-transform"
  spec.version       = "0.0.1"
  spec.authors       = ["Grayson Chao"]
  spec.email         = ["grayson.chao@gmail.com"]
  spec.description   = %q{Input parser plugin which allows arbitrary transformation of input JSON}
  spec.summary       = %q{Input parser plugin which allows arbitrary transformation of input JSON}
  spec.homepage      = "https://github.com/graysonc/fluent-plugin-json-transform"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
