# frozen_string_literal: true

Array.class_eval do
  # @return [String]
  def to_or_sentence
    to_sentence(two_words_connector: ' or ', last_word_connector: ', or ')
  end
end

Set.class_eval do
  extend Forwardable

  def_delegators :to_a, :to_or_sentence
end
