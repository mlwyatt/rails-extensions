# frozen_string_literal: true

Date.class_eval do
  # @return [String] - yyyy-mm-dd
  def input(_all = false)
    strftime('%F')
  end
end

DateTime.class_eval do
  # @return [String] - yyyy-mm-dd[Thh:mm::ss]
  def input(all = false)
    strftime(all ? '%F %T' : '%F')
  end
end
