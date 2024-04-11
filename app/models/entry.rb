# frozen_string_literal: true

class Entry < ApplicationRecord # :nodoc:
  validates :term, :audio_url, presence: true
  validates :audio_url, format: { with: URI::DEFAULT_PARSER.make_regexp }

  has_many :part_of_speaches

  def self.search_or_create!(word)
    # TODO: This method don't work good 🙃
    entry = Entry.find_by(term: word.downcase)
    return entry if entry.present?

    ActiveRecord::Base.transaction do
      data = Entries::Search.new(word).call
      entry = Entry.create!(term: data['word'].downcase, audio_url: data['phonetics'].first['audio'].downcase)

      data['meanings'].each do |meaning|
        part_of_speach = entry.part_of_speaches.create!(speach_type: meaning['partOfSpeech'].downcase)
        meaning['definitions'].each do |definition|
          part_of_speach.definitions.create!(explanation: definition['definition'].downcase,
                                             context: definition['example'].downcase || '')
        end
      end
    end

    entry
  rescue StandardError => e
    puts "Error: #{e.message}"

    Entry.new
  end
end
