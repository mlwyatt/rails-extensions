# frozen_string_literal: true

Array.class_eval do
  # @return [Boolean] true if all elements evaluate to true for all provided `fns`
  def pipe_and_all?(*fns)
    result = true
    each do |a|
      result &&= fns.reduce(a, &:send) && (block_given? ? yield(a) : true)
      break unless result
    end

    return result
  end
end
