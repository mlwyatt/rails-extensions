# frozen_string_literal: true

module ActiveRecord
  module Scoping
    module Named
      module ClassMethods
        # https://groups.google.com/d/msg/rubyonrails-core/CaQUODSuwDM/EjVkN6VMBwAJ
        def boolean_scope(column_name, options = {})
          options ||= {}
          positive = options[:positive] || column_name
          negative = options[:negative] || "not_#{column_name}"
          scope(:"#{positive}", -> { where(column_name => true) })
          scope(:"#{negative}", -> { where(column_name => false) })

          # already defined by +ActiveRecord+
          # define_method("#{positive}?") do
          #   !!__send__("#{column_name}?")
          # end
          define_method("#{negative}?") do
            !__send__("#{column_name}?")
          end
        end
      end
    end
  end
end
