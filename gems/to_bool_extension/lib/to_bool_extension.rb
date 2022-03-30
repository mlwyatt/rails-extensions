# frozen_string_literal: true

TrueClass.class_eval do
  # :nodoc:
  def to_bool
    true
  end
end

FalseClass.class_eval do
  # :nodoc:
  def to_bool
    false
  end
end

NilClass.class_eval do
  # :nodoc:
  def to_bool
    false
  end
end

String.class_eval do
  # :nodoc:
  def to_bool
    match?(/^(true|1|t|y|yes)$/i)
  end
end

Numeric.class_eval do
  # :nodoc:
  def to_bool
    to_s.to_bool
  end
end
