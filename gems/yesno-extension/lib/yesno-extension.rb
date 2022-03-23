# frozen_string_literal: true

class TrueClass
  # :nodoc:
  def yesno
    'Yes'
  end
end

class FalseClass
  # :nodoc:
  def yesno
    'No'
  end
end

class NilClass
  # :nodoc:
  def yesno
    'N/A'
  end
end
