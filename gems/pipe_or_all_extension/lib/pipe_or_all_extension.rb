# frozen_string_literal: true

Array.class_eval do
  # @return [Boolean] true if any element evaluates to true for all provided `fns`
  def pipe_or_all?(*fns)
    result = true
    each do |a|
      result &&= fns.reduce(a, &:send) || (block_given? ? yield(a) : true)
      break unless result
    end

    return result
  end
end
