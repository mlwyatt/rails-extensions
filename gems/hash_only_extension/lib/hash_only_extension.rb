# frozen_string_literal: true

Hash.class_eval do
  # The opposite of +Hash.except+.
  # ~/.rvm/gems/ruby-2.1.2/gems/activesupport-4.2.5/lib/active_support/core_ext/hash/except.rb
  # https://apidock.com/rails/Hash/except
  #
  # Selects only the supplied keys.
  #
  # http://api.rubyonrails.org/classes/Hash.html#method-i-slice
  #
  def only(*keys)
    slice(*keys)
  end

  # See +only+
  #
  # http://apidock.com/rails/v4.1.8/Hash/extract%21
  #
  def only!(*keys)
    slice!(*keys)
  end
end
