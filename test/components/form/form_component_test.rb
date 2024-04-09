# frozen_string_literal: true

require "test_helper"

class Form::FormComponentTest < ViewComponent::TestCase
  test 'render form' do
    form_component = render_inline Form::FormComponent.new

    assert_selector form_selector
    assert_equal(term_input, form_component.css('input.input').to_html)
    assert_selector 'div.buttons.mt-2'
    assert_equal(submit_button, form_component.css('input.button.is-primary.is-fullwidth').to_html)
  end

  private

  def term_input
    '<input placeholder="What do you want to search?" class="input" ' +
      'data-entry-target="term" type="text" name="term" id="term">'
  end

  def submit_button
    '<input type="submit" name="commit" value="Search" ' +
      'class="button is-primary is-fullwidth" data-disable-with="Search">'
  end

  def form_selector
    'form#new_entrie_form[action="/entries"][accept-charset="UTF-8"][method="post"]'
  end
end
