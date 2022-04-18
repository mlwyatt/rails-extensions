# frozen_string_literal: true

module RailsExtensions
  # requires all the gems
  def require_gems
    gem_list.each do |gem_base|
      if configuration.public_send("#{flag_name(gem_base)}?")
        require(gem_name(gem_base))
      end
    end
  end

  module_function :require_gems

  # @return [CONFIGURATION]
  def self.configuration
    @configuration ||= CONFIGURATION.new
  end

  # @yield [Configuration]
  def self.configure
    yield(configuration)
  end

  # @return [Array<Symbol>]
  def configuration_flags
    CONFIGURATION.members
  end

  module_function :configuration_flags

  private

    # @return [Symbol] the flag name
    def flag_name(gem_base)
      :"include_#{gem_base}"
    end

    module_function :flag_name

    # @return [String] the gem name
    def gem_name(gem_base)
      "#{gem_base}_extension"
    end

    module_function :gem_name

    BOOLEAN_GEMS = %i[
      compact_map
      current_day
      current_month
      current_week
      day_of_week
      display_military
      display_user
      find_bang
      find_dupes
      first_dupe
      google_format
      hash_only
      input
      in_utc
      month_and_year
      month_year
      overlaps
      pipe
      to_bool
      to_dec
      to_i
      to_or_sentence
      to_sort_i
      to_x
      usd_to_f
      usd_to_i
      yesno
    ].freeze

    # @return [Array<Symbol>] the list of gems
    def gem_list
      BOOLEAN_GEMS
    end

    module_function :gem_list

    CONFIGURATION = Struct.new(*gem_list.map(&method(:flag_name))) do
      members.each do |gem_member|
        define_method(:"#{gem_member}?") do
          public_send(gem_member) != false
        end
      end

      # Sets all flags to true by default
      def initialize
        super

        members.each do |gem_member|
          public_send("#{gem_member}=", true)
        end
      end
    end
end
