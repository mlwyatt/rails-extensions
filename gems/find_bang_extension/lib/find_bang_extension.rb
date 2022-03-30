# frozen_string_literal: true

Array.class_eval do
  # :nodoc:
  def find!(&block)
    x = find(&block)
    raise('Not found') if x.blank?

    x
  end
end
