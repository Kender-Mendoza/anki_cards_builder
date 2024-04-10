# frozen_string_literal: true

class Entry < ApplicationRecord # :nodoc:
  validates :term, :audio_url, presence: true
  validates :audio_url, format: { with: URI::DEFAULT_PARSER.make_regexp }

  has_many :part_of_speaches
end
