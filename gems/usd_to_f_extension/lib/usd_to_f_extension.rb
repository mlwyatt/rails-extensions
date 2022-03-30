# frozen_string_literal: true

NilClass.class_eval do
  # :nodoc:
  def usd_to_f
    nil
  end
end

Numeric.class_eval do
  # :nodoc:
  def usd_to_f
    to_f
  end
end

String.class_eval do
  # :nodoc:
  def usd_to_f
    gsub(/[$,]/, '').to_f
  end
end
