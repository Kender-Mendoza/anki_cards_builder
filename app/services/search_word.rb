# frozen_string_literal: true

class SearchWord # :nodoc:
  def initialize; end

  def call
    word_data
  end

  private

  attr_reader :url

  def word_data
    response = RestClient.get url

    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    puts "Error al realizar la solicitud: #{e.response}"
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end
