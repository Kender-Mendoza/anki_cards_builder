require 'test_helper'
require 'minitest/autorun'
require 'json'

class Entries::SearchTest < ActiveSupport::TestCase
  def setup
    @mock_response = Minitest::Mock.new
    @mock_response.expect(:body, [mock_entry_data].to_json)
  end

  test 'search entry' do
    RestClient.stub(:get, @mock_response) do
      result = Entries::Search.new('example').call

      assert_equal mock_entry_data_parsed, result
    end
  end

  private

  def mock_entry_data
    file_content = File.read('test/fixtures/files/entry_search_response.json')

    JSON.parse(file_content)
  end

  def mock_entry_data_parsed
    {
      term: 'example',
      audio_url: 'https://api.dictionaryapi.dev/media/pronunciations/en/example-us.mp3',
      meanings: [
        {
        speach_type: 'noun',
        definitions: [
            { explanation: 'something that is representative of all such things in a group.', context: '' },
            { explanation: 'something that serves to illustrate or explain a rule.', context: '' },
            {explanation: 'something that serves as a pattern of behaviour to be imitated (a good example) or not to be imitated (a bad example).', context: ''},
            { explanation: 'a person punished as a warning to others.', context: '' },
            { explanation: 'a parallel or closely similar case, especially when serving as a precedent or model.', context: '' },
            {explanation: 'an instance (as a problem to be solved) serving to illustrate the rule or precept or to act as an exercise in the application of the rule.', context: ''}
          ]
        },
        {
          speach_type: 'verb',
          definitions: [{ explanation: 'to be illustrated or exemplified (by).', context: '' }]
        }
      ]
    }
  end
end
