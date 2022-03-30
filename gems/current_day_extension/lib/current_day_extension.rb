# frozen_string_literal: true

DateTime.class_eval do
  # :nodoc:
  def current_day
    beginning_of_day..end_of_day
  end
end
