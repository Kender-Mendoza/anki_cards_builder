# frozen_string_literal: true

require "test_helper"
# require 'pry'

class Entry::EntryComponentTest < ViewComponent::TestCase
  test 'render entry component' do
    entry = entries(:one)
    entry_component = render_inline Entry::EntryComponent.new(entry:)

    assert_selector 'section'
    # Term section
    assert_equal(%(<h2 class="subtitle mb-0 is-size-4"> Term: </h2>), entry_component.css('h2')[0].to_html)
    assert_equal(%(<strong> Great </strong>), entry_component.css('span.is-clickable.is-size-4 strong')[0].to_html)
    assert_equal(input_html('term', 'Great').html_safe, entry_component.css('input')[0].to_html)
    # Audio Section
    assert_equal(%(<h2 class="subtitle mb-0 is-size-4"> Audio url: </h2>), entry_component.css('h2')[1].to_html)
    assert_equal(input_html('audio_url', 'Http//example.com').html_safe, entry_component.css('input')[1].to_html)
    assert_equal(%(<strong> Http//example.com </strong>),
                 entry_component.css('span.is-clickable.is-size-4 strong')[1].to_html)
    # part of speaches
    assert_equal(%(<h2 class="subtitle mb-0 is-size-4"> Noun: </h2>), entry_component.css('h2')[2].to_html)
    assert_equal(input_html('noun', 'The explanation of one').html_safe, entry_component.css('input')[2].to_html)
    assert_equal(%(<p> <strong> Example:</strong> The example of one </p>), entry_component.css('p').to_html)
    assert_equal(%(<strong> The explanation of one </strong>),
                 entry_component.css('span.is-clickable.is-size-4 strong')[2].to_html)
    # Matches
    assert_equal entry_component.css('hr').count, 3
    assert_equal entry_component.css(div_container_html).count, 3
    assert_equal entry_component.css('span.tag.is-info.entry-section__copy-button').count, 3
  end

  def input_html(id, value)
    "<input type=\"hidden\" name=\"#{id}\" id=\"#{id}\" value=\"#{value}\" " +
      'data-entry-section-target="term" autocomplete="off">'
  end

  def div_container_html
    'div.is-relative.is-inline-flex.entry-section' +
      '[data-action="mouseleave->entry-section#setCopyMessage"]' +
      '[data-controller="entry-section"]'
  end
end
