# frozen_string_literal: true

Array.class_eval do
  # @return [Boolean]
  def overlaps?(other)
    (self & Array(other)).present?
  end
end
