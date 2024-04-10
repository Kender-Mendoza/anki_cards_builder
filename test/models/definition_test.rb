require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase
  setup do
    @part_of_speach = part_of_speaches(:one)
  end

  test 'should not save definition without explanation' do
    definition = Definition.new(context: 'Some context', part_of_speach: @part_of_speach)
    assert_not definition.save, 'Saved the definition without an explanation'
  end

  test 'should not save definition without part of speach reference' do
    definition = Definition.new(explanation: 'Some explanation', context: 'Some context')
    assert_not definition.save, 'Saved the definition without an explanation'
  end

  test 'should save definition with valid attributes' do
    definition = Definition.new(explanation: 'Some explanation', context: 'Some context',
                                part_of_speach: @part_of_speach)
    assert definition.save, 'Could not save the definition with valid attributes'
  end
end
