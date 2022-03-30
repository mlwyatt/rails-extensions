# frozen_string_literal: true

Array.class_eval do
  # Replace my_array.map(&:method1).map(&:method2) with my_array.pipe(:method1, :method2)
  # @return [Array]
  def pipe(*fns)
    map { |a| fns.reduce(a, &:send) }
  end
end
