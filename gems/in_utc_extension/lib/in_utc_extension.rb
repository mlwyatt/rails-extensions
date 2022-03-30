# frozen_string_literal: true

DateTime.class_eval do
  # @return [DateTime]
  def in_utc
    utc? ? self : in_time_zone('UTC').to_datetime
  end
end

Time.class_eval do
  # @return [Time]
  def in_utc
    utc? ? self : in_time_zone('UTC')
  end
end
