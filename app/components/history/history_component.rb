# typed: strict
# frozen_string_literal: true

class History::HistoryComponent < ViewComponent::Base
  def initialize(history:)
    super()
    @history = history
  end

  private

  COLORS = {
    verb: 'text',
    noun: 'link',
    interjection: 'info',
    adjective: 'success',
    adverb: 'warning',
    pronoun: 'danger'
  }.freeze

  attr_reader :history

  def limit_line_explanation(speach_type, explanation)
    speach_type_chars = speach_type.size
    explanation.first(22 - speach_type_chars)
  end

  def term_content
    history.part_of_speaches.map do |speache|
      speache.definitions.map do |definition|
        "<strong> #{speache.speach_type}: </strong> #{definition.explanation}"
      end.join(' ')
    end.join(' ')
  end

  def media_icon
    content_tag(:div,
                class: "has-background-#{color}-95 card is-shadowless px-3 py-1") do
      content_tag(:span, class: "is-size-4 has-text-#{color}-50") do
        content_tag(:i, '', class: 'fa-solid fa-font')
      end
    end
  end

  def color
    @color ||= COLORS[valid_speach_type]
  end

  def speach_types
    history.part_of_speaches.map(&:speach_type).uniq.reverse
  end

  def valid_speach_type
    speach_types.find do |speach_type|
      !COLORS[speach_type.to_sym].nil?
    end&.to_sym || :verb
  end
end
