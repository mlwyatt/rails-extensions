# frozen_string_literal: true

Array.class_eval do
  # @param threshold [Integer] default 1
  # @return [Array] excluding items that appear more than `threshold` times
  def find_dupes(threshold = 1)
    select { |item| count(item) > threshold }.uniq
  end
end
