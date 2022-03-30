# frozen_string_literal: true

Array.class_eval do
  # @return [Array]
  # Similar to `filter_map` but excludes `nil` instead of falsy
  def compact_map
    return to_enum(:compact_map) unless block_given?

    r = []
    each do |*args|
      result = yield(*args)
      r.push(result) unless result.nil?
    end
    r
  end
end
