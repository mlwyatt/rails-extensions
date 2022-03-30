# frozen_string_literal: true

Date.class_eval do
  # @return [String] - mm/yy
  def month_and_year
    strftime('%m/%y')
  end
end
