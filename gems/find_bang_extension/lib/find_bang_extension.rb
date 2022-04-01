# frozen_string_literal: true

Array.class_eval do
  # :nodoc:
  def find!(&block)
    x = find(&block)
    raise('Not found') if x.nil?

    x
  end
end

Set.class_eval do
  extend Forwardable

  def_delegators :to_a, :find!
end
