# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cal_exporter/version'

Gem::Specification.new do |spec|
  spec.name          = "cal_exporter"
  spec.version       = CalExporter::VERSION
  spec.authors       = ["sota0805"]
  spec.email         = ["sota.yamashita@gmail.com"]
  spec.summary       = %q{Calander Exporter}
  spec.description   = %q{Calander Exporter}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'icalendar', '~> 1.5', '>= 1.5.1'
  spec.add_runtime_dependency 'thor', '~> 0.18', '>= 0.18.1'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
