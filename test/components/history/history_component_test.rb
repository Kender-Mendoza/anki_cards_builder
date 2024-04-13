# frozen_string_literal: true

require "test_helper"

class History::HistoryComponentTest < ViewComponent::TestCase
  test 'render history' do
    history = entries(:one)
    history_component = render_inline History::HistoryComponent.new(history:)

    assert_selector 'div.column.is-half'
    assert_selector 'div.notification.is-primary'
    assert_equal(p_term_html, history_component.css('p.is-size-4.has-text-centered').to_html)
    assert_equal(p_explanation_html, history_component.css('p:nth-child(2)').to_html)
  end

  private

  def p_term_html
    %(<p class="is-size-4 has-text-centered"> Great </p>)
  end

  def p_explanation_html
    %(<p> <strong> noun: </strong> the explanation of... </p>)
  end
end
