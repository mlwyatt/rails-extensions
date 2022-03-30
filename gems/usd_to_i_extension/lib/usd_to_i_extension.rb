# frozen_string_literal: true

NilClass.class_eval do
  # :nodoc:
  def usd_to_i
    nil
  end
end

String.class_eval do
  # :nodoc:
  def usd_to_i
    gsub(/[$,]/, '').to_i
  end
end
