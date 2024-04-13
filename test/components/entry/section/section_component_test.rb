# frozen_string_literal: true

require "test_helper"

class Entry::Section::SectionComponentTest < ViewComponent::TestCase
  test 'render without example' do
    section =
      render_inline Entry::Section::SectionComponent.new(name_section: 'The name',
                                                         entry_section: 'the section name')

    assert_selector div_container_html
    assert_equal(%(<h2 class="subtitle mb-0 is-size-4"> The name: </h2>), section.css('h2').to_html)
    assert_equal(copy_element_html, section.css('span.tag.is-info.entry-section__copy-button').to_html)
    assert_equal(%(<strong> The section name </strong>), section.css('span > strong').to_html)
    refute_equal(%(<p> <strong> Example:</strong> The example </p>), section.css('p').to_html)
    assert_equal(input_html, section.css('input').to_html)
    assert_selector('hr')
  end

  test 'render with example' do
    section =
      render_inline Entry::Section::SectionComponent.new(name_section: 'The name',
                                                         entry_section: 'the section name',
                                                         example_section: 'the example')

    assert_selector div_container_html
    assert_equal(%(<h2 class="subtitle mb-0 is-size-4"> The name: </h2>), section.css('h2').to_html)
    assert_equal(copy_element_html, section.css('span.tag.is-info.entry-section__copy-button').to_html)
    assert_equal(%(<strong> The section name </strong>), section.css('span > strong').to_html)
    assert_equal(%(<p> <strong> Example:</strong> The example </p>), section.css('p').to_html)
    assert_equal(input_html, section.css('input').to_html)
    assert_selector('hr')
  end

  private

  def input_html
    '<input type="hidden" name="the_name" id="the_name" value="The section name" ' +
      'data-entry-section-target="term" autocomplete="off">'
  end

  def div_container_html
    'div.is-relative.is-inline-flex.entry-section' +
      '[data-action="mouseleave->entry-section#setCopyMessage"]' +
      '[data-controller="entry-section"]'
  end

  def copy_element_html
    %(<span class="tag is-info entry-section__copy-button" data-entry-section-target="copyMessage"> copy </span>)
  end
end
