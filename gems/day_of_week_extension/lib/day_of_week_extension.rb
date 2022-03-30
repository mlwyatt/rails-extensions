# frozen_string_literal: true

Date.class_eval do
  # @return [String] - Full day word
  def day_of_week
    strftime('%A')
  end
end

DateTime.class_eval do
  # @return [String] - Full day word
  def day_of_week
    strftime('%A')
  end
end
