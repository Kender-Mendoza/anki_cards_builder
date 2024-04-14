require 'test_helper'

class PartOfSpeachTest < ActiveSupport::TestCase
  test 'should not save part of speach without speach_type' do
    part_of_speach = PartOfSpeach.new
    assert_not part_of_speach.save, 'Saved the part of speach without a speach_type'
  end

  test 'should save part of speach with valid attributes' do
    entry = entries(:one)
    part_of_speach = PartOfSpeach.new(speach_type: 'noun', entry:)
    assert part_of_speach.save, 'Could not save the part of speach with valid attributes'
  end

  test 'create definitions!' do
    part_of_speache = PartOfSpeach.create!(speach_type: 'noun', entry: entries(:one))
    part_of_speache.create_definitions!([{ explanation: 'a test or trial', context: 'This is a test.' }])

    definition = part_of_speache.definitions.first

    assert_equal definition.explanation, 'a test or trial'
    assert_equal definition.context, 'This is a test.'
  end
end
