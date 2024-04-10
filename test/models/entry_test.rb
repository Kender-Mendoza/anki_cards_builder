require 'test_helper'

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
end
