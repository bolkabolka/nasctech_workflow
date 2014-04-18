# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nasctech_workflow/version'

Gem::Specification.new do |spec|
  spec.name          = 'nasctech_workflow'
  spec.version       = NasctechWorkflow::VERSION
  spec.authors       = ['Slavik Balabolka']
  spec.email         = ['bolkabolka@gmail.com']
  spec.summary       = %q{CLI tools for Nasctech workflows.}
  spec.description   = %q{CLI tools for automate processes with Redmine and git.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'slop'
  spec.add_runtime_dependency 'activeresource', '~> 4.0.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
