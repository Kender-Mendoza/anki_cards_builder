require "test_helper"
require 'minitest/autorun'

class EntriesControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    get root_path

    assert_response :success
    assert_template :index
    assert_not_nil assigns(:entries)
    assert_equal 2, assigns(:entries).size
  end

  test "create success" do
    example = 'example'

    Entries::Search.stub(:new, ->(_example) { OpenStruct.new(call: mock_entry_data_parsed) }) do
      post entries_url(format: :turbo_stream), params: { term: example }

      entry = assigns(:entry)

      assert_response :success
      assert_equal example, entry.term
      assert_equal 'https://audio.example.com/test.mp3', entry.audio_url

      assert_equal 1, entry.part_of_speaches.count
      part_of_speach = entry.part_of_speaches.first
      assert_equal 'noun', part_of_speach.speach_type

      assert_equal 1, part_of_speach.definitions.count
      definition = part_of_speach.definitions.first
      assert_equal 'a test or trial', definition.explanation
      assert_equal 'This is a test.', definition.context
    end
  end

  test 'create failure' do
    word = 'error_word'
    Entries::Search.stub(:new, ->(_word) { raise StandardError.new('Error fetching data') }) do
      post entries_url(format: :turbo_stream), params: { term: word }

      assert_redirected_to entries_path
      assert_equal 'Error when search the word', flash[:notice]
    end
  end

  private

  def mock_entry_data_parsed
    {
      term: 'example',
      audio_url: 'https://audio.example.com/test.mp3',
      meanings: [
        {
          speach_type: 'noun',
          definitions: [
            { explanation: 'a test or trial', context: 'This is a test.' },
          ]
        }
      ]
    }
  end
end
