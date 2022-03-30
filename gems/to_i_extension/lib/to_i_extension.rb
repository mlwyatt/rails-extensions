# frozen_string_literal: true

TrueClass.class_eval do
  # :nodoc:
  def to_i
    1
  end
end

FalseClass.class_eval do
  # :nodoc:
  def to_i
    0
  end
end
