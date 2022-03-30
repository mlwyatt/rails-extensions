# frozen_string_literal: true

Array.class_eval do
  # @param threshold [Integer] default 1
  # @return [*] first items that appears more than `threshold` times
  def first_dupe(threshold = 1)
    find { |item| count(item) > threshold }
  end
end
