# frozen_string_literal: true

class Entry::EntryComponent < ViewComponent::Base # :nodoc:
  def initialize(entry:)
    super()
    @entry = entry
  end
end
