# typed: strict
# frozen_string_literal: true

class History::HistoryComponent < ViewComponent::Base
  def initialize(history:)
    @history = history
  end

  private

  def limit_line_explanation(speach_type, explanation)
    speach_type_chars = speach_type.size
    explanation.first(22 - speach_type_chars)
  end
end
