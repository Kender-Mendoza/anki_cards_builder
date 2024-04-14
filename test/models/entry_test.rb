require 'test_helper'
require 'minitest/autorun'

class EntryTest < ActiveSupport::TestCase
  test 'should not save entry without term' do
    entry = Entry.new(audio_url: 'http://example.com/audio.mp3')
    assert_not entry.save, 'Saved the entry without a term'
  end

  test 'should not save entry without audio_url' do
    entry = Entry.new(term: 'example')
    assert_not entry.save, 'Saved the entry without an audio_url'
  end

  test 'should not save entry with invalid audio_url' do
    entry = Entry.new(term: 'example', audio_url: 'invalid_url')
    assert_not entry.save, 'Saved the entry with an invalid audio_url'
  end

  test 'should save entry with valid attributes' do
    entry = Entry.new(term: 'example', audio_url: 'http://example.com/audio.mp3')
    assert entry.save, 'Could not save the entry with valid attributes'
  end

  test 'search or create new entry with exist entry' do
    existing_entry = Entry.create(term: 'example', audio_url: 'https://audio.example.com/test.mp3')

    entry = Entry.search_or_create!('example')

    assert_equal existing_entry.id, entry.id
    assert_equal 'example', entry.term
  end

  test 'search or create new entry without exist entry' do
    word = 'example'
    Entries::Search.stub(:new, ->(_word) { OpenStruct.new(call: mock_entry_data_parsed) }) do
      entry = Entry.search_or_create!(word)

      assert_equal word, entry.term
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

  test 'search or create new entry error handling' do
    word = 'error_word'
    Entries::Search.stub(:new, ->(_word) { raise StandardError, 'Error fetching data' }) do
      entry = Entry.search_or_create!(word)

      assert_instance_of Entry, entry
      assert_nil entry.id
      assert_nil entry.term
    end
  end

  test 'create part of speaches!' do
    data = mock_entry_data_parsed
    entry = Entry.create!(term: data[:term], audio_url: data[:audio_url])
    entry.create_part_of_speaches!(data[:meanings])

    meaning = entry.part_of_speaches.first
    definition = meaning.definitions.first

    data_meaning = data[:meanings].first
    data_definition = data_meaning[:definitions].first

    assert_equal meaning.speach_type, data_meaning[:speach_type]
    assert_equal definition.explanation, data_definition[:explanation]
    assert_equal definition.context, data_definition[:context]
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
            { explanation: 'a test or trial', context: 'This is a test.' }
          ]
        }
      ]
    }
  end
end
