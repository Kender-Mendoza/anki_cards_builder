# typed: strict
# frozen_string_literal: true

# require 'sorbet-runtime'
class History::HistoryComponent < ViewComponent::Base
  sig { params(history: Entry).void }
  def initialize(history:)
    @history = T.let(history, Entry)
  end

  private

  sig { params(speach_type: String, explanation: String).returns(String) }
  def limit_line_explanation(speach_type, explanation); end
end
