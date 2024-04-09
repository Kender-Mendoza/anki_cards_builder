# frozen_string_literal: true

class Entry::EntryComponent < ViewComponent::Base # :nodoc:
  def initialize(entry:)
    @entry = entry
  end
end
