# frozen_string_literal: true

module Entries
  class Search # :nodoc:
    def initialize(entry)
      @url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{entry}"
    end

    def call
      parse_response
    rescue RestClient::ExceptionWithResponse => e
      puts "Error al realizar la solicitud: #{e.response}"
    rescue StandardError => e
      puts "Error: #{e.message}"
    end

    private

    attr_reader :url

    def entry_data
      response = RestClient.get(url)

      JSON.parse(response.body)
    end

    def parse_response
      json_response = entry_data.first

      {
        term: json_response['word'].downcase,
        audio_url: find_audio_url(json_response['phonetics']),
        meanings: build_meanings(json_response['meanings'])
      }
    end

    def find_audio_url(phonetics)
      phonetics.find { |phonetic| phonetic['audio'] != '' }['audio']
    end

    def build_meanings(meanings)
      meanings.map do |meaning|
        {
          speach_type: meaning['partOfSpeech'].downcase,
          definitions: build_definitions(meaning['definitions'])
        }
      end
    end

    def build_definitions(definitions)
      definitions.map do |definition|
        {
          explanation: definition['definition'].downcase,
          context: definition['example']&.downcase || ''
        }
      end
    end
  end
end
