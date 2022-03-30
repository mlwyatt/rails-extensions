# frozen_string_literal: true

require 'to_i_extension'

TrueClass.class_eval do
  alias_method :to_sort_i, :to_i
end

FalseClass.class_eval do
  alias_method :to_sort_i, :to_i
end

NilClass.class_eval do
  # :nodoc:
  def to_sort_i
    -1
  end
end
