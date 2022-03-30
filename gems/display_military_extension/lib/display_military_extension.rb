# frozen_string_literal: true

DateTime.class_eval do
  # @return [String]
  def display_military(all = false)
    strftime(all ? '%m/%d/%Y %T' : '%-m/%-d/%y %T')
  end
end

Time.class_eval do
  # @return [String]
  def display_military(all = false)
    to_datetime.display_military(all)
  end
end
