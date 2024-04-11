# frozen_string_literal: true

module Entries
  class Search # :nodoc:
    def initialize(entry)
      @url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{entry}"
    end

    def call
      entry_data
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
  end
end
