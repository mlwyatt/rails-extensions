# frozen_string_literal: true

Date.class_eval do
  # @return [String] - yyyy-mm
  def month_year
    input[0, 7]
  end
end
