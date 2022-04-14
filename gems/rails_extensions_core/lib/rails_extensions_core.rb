# frozen_string_literal: true

require 'configurations'

module RailsExtensions
  include Configurations

  configurable(
    Boolean,
    include: %i[
      compact_map current_day current_month current_week day_of_week display_military display_user find_bang find_dupes
      first_dupe google_format hash_only input in_utc month_and_year month_year overlaps pipe to_bool to_dec to_i
      to_or_sentence to_sort_i to_x usd_to_f usd_to_i yesno logger_cycle
    ]
  )
  configuration_defaults do |c|
    c.include.compact_map = true
    c.include.current_day = true
    c.include.current_month = true
    c.include.current_week = true
    c.include.day_of_week = true
    c.include.display_military = true
    c.include.display_user = true
    c.include.find_bang = true
    c.include.find_dupes = true
    c.include.first_dupe = true
    c.include.google_format = true
    c.include.hash_only = true
    c.include.input = true
    c.include.in_utc = true
    c.include.month_and_year = true
    c.include.month_year = true
    c.include.overlaps = true
    c.include.pipe = true
    c.include.to_bool = true
    c.include.to_dec = true
    c.include.to_i = true
    c.include.to_or_sentence = true
    c.include.to_sort_i = true
    c.include.to_x = true
    c.include.usd_to_f = true
    c.include.usd_to_i = true
    c.include.yesno = true
    c.include.logger_cycle = true
  end
end

require 'compact_map_extension' if RailsExtensions.configuration.include.compact_map
require 'current_day_extension' if RailsExtensions.configuration.include.current_day
require 'current_month_extension' if RailsExtensions.configuration.include.current_month
require 'current_week_extension' if RailsExtensions.configuration.include.current_week
require 'day_of_week_extension' if RailsExtensions.configuration.include.day_of_week
require 'display_military_extension' if RailsExtensions.configuration.include.display_military
require 'display_user_extension' if RailsExtensions.configuration.include.display_user
require 'find_bang_extension' if RailsExtensions.configuration.include.find_bang
require 'find_dupes_extension' if RailsExtensions.configuration.include.find_dupes
require 'first_dupe_extension' if RailsExtensions.configuration.include.first_dupe
require 'google_format_extension' if RailsExtensions.configuration.include.google_format
require 'hash_only_extension' if RailsExtensions.configuration.include.hash_only
require 'input_extension' if RailsExtensions.configuration.include.input
require 'in_utc_extension' if RailsExtensions.configuration.include.in_utc
require 'month_and_year_extension' if RailsExtensions.configuration.include.month_and_year
require 'month_year_extension' if RailsExtensions.configuration.include.month_year
require 'overlaps_extension' if RailsExtensions.configuration.include.overlaps
require 'pipe_extension' if RailsExtensions.configuration.include.pipe
require 'to_bool_extension' if RailsExtensions.configuration.include.to_bool
require 'to_dec_extension' if RailsExtensions.configuration.include.to_dec
require 'to_i_extension' if RailsExtensions.configuration.include.to_i
require 'to_or_sentence_extension' if RailsExtensions.configuration.include.to_or_sentence
require 'to_sort_i_extension' if RailsExtensions.configuration.include.to_sort_i
require 'to_x_extension' if RailsExtensions.configuration.include.to_x
require 'usd_to_f_extension' if RailsExtensions.configuration.include.usd_to_f
require 'usd_to_i_extension' if RailsExtensions.configuration.include.usd_to_i
require 'yesno_extension' if RailsExtensions.configuration.include.yesno
require 'logger_cycle_extension' if RailsExtensions.configuration.include.logger_cycle
