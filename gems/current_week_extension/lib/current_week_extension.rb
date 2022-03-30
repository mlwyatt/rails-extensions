# frozen_string_literal: true

Date.class_eval do
  # @return Range<Date>
  def current_week
    beginning_of_week..end_of_week
  end
end

DateTime.class_eval do
  # @return Range<Date>
  def current_week
    beginning_of_week..end_of_week
  end
end
