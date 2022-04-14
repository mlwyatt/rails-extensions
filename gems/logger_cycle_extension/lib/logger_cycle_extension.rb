# frozen_string_literal: true

module Logger
  class LogDevice
    private

      # The same as lib/ruby/3.0.0/logger/log_device.rb
      def shift_log_age_with_trunc_copy
        (@shift_age - 3).downto(0) do |i|
          if FileTest.exist?("#{@filename}.#{i}")
            File.rename("#{@filename}.#{i}", "#{@filename}.#{i + 1}")
          end
        end

        # write and diff
        FileUtils.cp(@filename.to_s, "#{@filename}.0")
        old_lines = File.readlines("#{@filename}.0")
        new_lines = File.readlines(@filename.to_s)
        @dev.truncate(0)
        # provide some overlap
        @dev.write(new_lines[old_lines.size - 5..].join("\n"))

        return true
      end

      # shift_log_age becomes shift_log_age_without_trunc_copy
      alias shift_log_age_without_trunc_copy shift_log_age
      # shift_log_age_with_trunc_copy becomes shift_log_age
      alias shift_log_age shift_log_age_with_trunc_copy
  end
end
