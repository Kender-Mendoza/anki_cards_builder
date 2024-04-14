# frozen_string_literal: true

class Entry < ApplicationRecord # :nodoc:
  validates :term, :audio_url, presence: true
  validates :audio_url, format: { with: URI::DEFAULT_PARSER.make_regexp }

  has_many :part_of_speaches

  class << self
    def search_or_create!(word)
      entry = Entry.find_by(term: word.downcase)
      return entry if entry.present?

      ActiveRecord::Base.transaction do
        entry_data = Entries::Search.new(word).call
        entry = Entry.create!(term: entry_data[:term], audio_url: entry_data[:audio_url])
        entry.create_part_of_speaches!(entry_data[:meanings])
      end

      entry
    rescue StandardError => e
      puts "Error: #{e.message}"

      Entry.new
    end
  end

  def create_part_of_speaches!(part_of_speaches)
    part_of_speaches.each do |meaning|
      part_of_speach = self.part_of_speaches.create!(speach_type: meaning[:speach_type])
      part_of_speach.create_definitions!(meaning[:definitions])
    end
  end
end
