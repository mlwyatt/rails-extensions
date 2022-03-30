# frozen_string_literal: true

TrueClass.class_eval do
  # :nodoc:
  def to_x(*_args)
    'X'
  end
end

FalseClass.class_eval do
  # :nodoc:
  def to_x(unless_true = '')
    unless_true
  end
end

NilClass.class_eval do
  # :nodoc:
  def to_x(unless_true = nil)
    unless_true
  end
end
