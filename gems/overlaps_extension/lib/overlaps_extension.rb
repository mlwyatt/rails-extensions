# frozen_string_literal: true

Array.class_eval do
  # @return [Boolean]
  def overlaps?(other)
    !(self & Array(other)).empty?
  end
end

Set.class_eval do
  extend Forwardable

  def_delegators :to_a, :overlaps?
end
