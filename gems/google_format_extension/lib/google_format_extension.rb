# frozen_string_literal: true

DateTime.class_eval do
  # @return [String] yyyy-mm-ddThh:mm:ss+hhmm
  def google_format
    strftime('%FT%T%z')
  end
end
