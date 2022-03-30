# rails-extensions
# **WIP**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_extensions_core'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_extensions_core


## Usage

```ruby
require 'rails_extensions_core'

true.yesno # => Yes
true.to_bool # => true
```

## Development

```shell
rake build_gems # Will build all gems
rake install_gems # Will install all gems
rake publish_gems # Will publish all gems to RubyGems
rake create_gem gem_name=my_gem # Will create a new gem named my_gem in /gems (copies core folder)
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mlwyatt/rails-extensions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mlwyatt/rails-extension/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the rails-extensions project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mlwyatt/rails-extensions/blob/master/CODE_OF_CONDUCT.md).
