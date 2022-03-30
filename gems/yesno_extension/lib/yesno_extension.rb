# frozen_string_literal: true

TrueClass.class_eval do
  # :nodoc:
  def yesno
    'Yes'
  end
end

FalseClass.class_eval do
  # :nodoc:
  def yesno
    'No'
  end
end

NilClass.class_eval do
  # :nodoc:
  def yesno
    'N/A'
  end
end
