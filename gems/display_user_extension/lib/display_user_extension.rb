# frozen_string_literal: true

Date.class_eval do
  # @return [String] - mm/dd/yyyy or m/d/yy
  def display_user(all = false)
    strftime(all ? '%m/%d/%Y' : '%-m/%-d/%y')
  end
end

DateTime.class_eval do
  # @return [String] - mm/dd/yyyy or m/d/yy
  def display_user(all = false)
    strftime(all ? '%m/%d/%Y %r' : '%-m/%-d/%y %r')
  end
end

Time.class_eval do
  # @return [String] - mm/dd/yyyy or m/d/yy
  def display_user(all = false)
    to_datetime.display_user(all)
  end
end
