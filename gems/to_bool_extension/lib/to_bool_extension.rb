# frozen_string_literal: true

class TrueClass
  # :nodoc:
  def to_bool
    true
  end
end

class FalseClass
  # :nodoc:
  def to_bool
    false
  end
end

class NilClass
  # :nodoc:
  def to_bool
    false
  end
end
