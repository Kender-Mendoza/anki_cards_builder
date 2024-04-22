# frozen_string_literal: true

require 'test_helper'

class History::HistoryComponentTest < ViewComponent::TestCase
  test 'render history' do
    history = entries(:one)
    history_component = render_inline History::HistoryComponent.new(history:)

    assert_selector 'div.column.is-half.is-full-touch'
    assert_selector 'div.card.is-shadowless.is-bordered'
    assert_selector "a[data-turbo-stream='true'][href='/entries/#{history.id}']"
    assert_selector 'div.card-content > div.media > div.media-left'
    assert_selector 'div.content'
    assert_equal(media_icon_html('link'),
                 history_component.css('div.has-background-link-95.card.is-shadowless.px-3.py-1').to_html)
    assert_equal(h4_term_html, history_component.css('div.content > h4').to_html)
    assert_equal(h6_explanation_html,
                 history_component.css('h6.is-hidden-overflow.is-size-6.has-text-weight-light').to_html)
    assert_selector div_arrow_icon_selector
  end

  test 'media icon text' do
    history_verb = entries(:entry_verb)
    history_component = render_inline History::HistoryComponent.new(history: history_verb)

    assert_equal(media_icon_html('text'),
                 history_component.css('div.has-background-text-95.card.is-shadowless.px-3.py-1').to_html)
  end

  test 'media icon link' do
    history_noun = entries(:entry_noun)
    history_component = render_inline History::HistoryComponent.new(history: history_noun)

    assert_equal(media_icon_html('link'),
                 history_component.css('div.has-background-link-95.card.is-shadowless.px-3.py-1').to_html)
  end

  test 'media icon info' do
    history_interjection = entries(:entry_interjection)
    history_component = render_inline History::HistoryComponent.new(history: history_interjection)

    assert_equal(media_icon_html('info'),
                 history_component.css('div.has-background-info-95.card.is-shadowless.px-3.py-1').to_html)
  end

  test 'media icon warning' do
    history_adverb = entries(:entry_adverb)
    history_component = render_inline History::HistoryComponent.new(history: history_adverb)

    assert_equal(media_icon_html('warning'),
                 history_component.css('div.has-background-warning-95.card.is-shadowless.px-3.py-1').to_html)
  end

  test 'media icon danger' do
    history_pronoun = entries(:entry_pronoun)
    history_component = render_inline History::HistoryComponent.new(history: history_pronoun)

    assert_equal(media_icon_html('danger'),
                 history_component.css('div.has-background-danger-95.card.is-shadowless.px-3.py-1').to_html)
  end

  test 'media icon default' do
    history_default = entries(:entry_default)
    history_component = render_inline History::HistoryComponent.new(history: history_default)

    assert_equal(media_icon_html('text'),
                 history_component.css('div.has-background-text-95.card.is-shadowless.px-3.py-1').to_html)
  end

  private

  def h4_term_html
    %(<h4> Great </h4>)
  end

  def h6_explanation_html
    '<h6 class="is-hidden-overflow is-size-6 has-text-weight-light">
            <strong> noun: </strong> the explanation of one
          </h6>'
  end

  def media_icon_html(color)
    "<div class=\"has-background-#{color}-95 card is-shadowless px-3 py-1\">" +
      "<span class=\"is-size-4 has-text-#{color}-50\"><i class=\"fa-solid fa-font\"></i>" +
      '</span></div>'
  end

  def div_arrow_icon_selector
    'div.has-text-right > span.is-size-4.has-text-primary-50.is-arrow-animation > i.fa-solid.fa-arrow-right'
  end
end
