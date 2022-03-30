# frozen_string_literal: true

Array.class_eval do
  # @return [String]
  def to_or_sentence
    to_sentence(two_words_connector: ' or ', last_word_connector: ', or ')
  end
end
