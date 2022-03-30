# frozen_string_literal: true

Array.class_eval do
  # @return [Boolean] true if any element evaluates to true for any provided `fns`
  def pipe_or_any?(*fns)
    result = false
    each do |a|
      result ||= fns.reduce(a, &:send) || (block_given? ? yield(a) : true)
      break if result
    end

    return result
  end
end
