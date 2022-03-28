# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'rails_extensions_core'
  spec.version = File.read(File.expand_path('VERSION', __dir__)).strip
  spec.authors = ['Marcus Wyatt']
  spec.email = ['mwyatt@brandsinsurance.com']

  spec.summary = 'Loads custom methods on various ruby classes'
  spec.homepage = 'https://github.com/mlwyatt/rails-extensions'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.1')

  spec.metadata['source_code_uri'] = 'https://github.com/mlwyatt/rails-extensions'

  spec.files = Dir['LICENSE.txt', 'CHANGELOG.md', 'VERSION', 'lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency('to_bool_extension', '0.0.1')
  spec.add_dependency('yesno_extension', '0.0.1')
end
