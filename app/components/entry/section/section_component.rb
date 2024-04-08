# frozen_string_literal: true

class Entry::Section::SectionComponent < ViewComponent::Base
  def initialize(name_section:, entry_section:, example_section: nil)
    @name_section = name_section.capitalize
    @entry_section = entry_section.capitalize
    @example_section = example_section&.capitalize
  end

  private

  attr_accessor :name_section, :example_section

  def input_name
    name_section.downcase.gsub(' ', '_').to_sym
  end

  def example?
    example_section.present?
  end
end
