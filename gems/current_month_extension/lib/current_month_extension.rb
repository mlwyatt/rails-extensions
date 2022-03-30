# frozen_string_literal: true

Date.class_eval do
  # :nodoc:
  def current_month
    beginning_of_month..end_of_month
  end
end

DateTime.class_eval do
  # :nodoc:
  def current_month
    beginning_of_month..end_of_month
  end
end
