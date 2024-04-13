require 'test_helper'

class PartOfSteachTest < ActiveSupport::TestCase
  test 'should not save part of speach without speach_type' do
    part_of_speach = PartOfSpeach.new
    assert_not part_of_speach.save, 'Saved the part of speach without a speach_type'
  end

  test 'should save part of speach with valid attributes' do
    entry = entries(:one)
    part_of_speach = PartOfSpeach.new(speach_type: 'noun', entry:)
    assert part_of_speach.save, 'Could not save the part of speach with valid attributes'
  end
end
