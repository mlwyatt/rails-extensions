# frozen_string_literal: true

NilClass.class_eval do
  # :nodoc:
  def to_dec(*_args)
    nil
  end
end

Numeric.class_eval do
  # :nodoc:
  def to_dec(p = 4)
    (to_f / 100.0).round(p)
  end
end

String.class_eval do
  # :nodoc:
  def to_dec(p = 4)
    (to_f / 100.0).round(p)
  end
end
