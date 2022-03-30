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

  spec.add_dependency('compact_map_extension', '0.0.4')
  spec.add_dependency('current_day_extension', '0.0.4')
  spec.add_dependency('current_month_extension', '0.0.4')
  spec.add_dependency('current_week_extension', '0.0.4')
  spec.add_dependency('day_of_week_extension', '0.0.4')
  spec.add_dependency('display_military_extension', '0.0.4')
  spec.add_dependency('display_user_extension', '0.0.4')
  spec.add_dependency('find_bang_extension', '0.0.4')
  spec.add_dependency('find_dupes_extension', '0.0.4')
  spec.add_dependency('first_dupe_extension', '0.0.4')
  spec.add_dependency('google_format_extension', '0.0.4')
  spec.add_dependency('hash_only_extension', '0.0.4')
  spec.add_dependency('input_extension', '0.0.4')
  spec.add_dependency('in_utc_extension', '0.0.4')
  spec.add_dependency('month_and_year_extension', '0.0.4')
  spec.add_dependency('month_year_extension', '0.0.4')
  spec.add_dependency('overlaps_extension', '0.0.4')
  spec.add_dependency('pipe_extension', '0.0.4')
  spec.add_dependency('to_bool_extension', '0.0.4')
  spec.add_dependency('to_dec_extension', '0.0.4')
  spec.add_dependency('to_i_extension', '0.0.4')
  spec.add_dependency('to_or_sentence_extension', '0.0.4')
  spec.add_dependency('to_sort_i_extension', '0.0.4')
  spec.add_dependency('to_x_extension', '0.0.4')
  spec.add_dependency('usd_to_f_extension', '0.0.4')
  spec.add_dependency('usd_to_i_extension', '0.0.4')
  spec.add_dependency('yesno_extension', '0.0.4')
end
