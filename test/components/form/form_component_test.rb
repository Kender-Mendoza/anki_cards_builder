# frozen_string_literal: true

require "test_helper"

class Form::FormComponentTest < ViewComponent::TestCase
  test 'render form' do
    form_component = render_inline Form::FormComponent.new

    assert_equal(form_html, form_component.css('form').to_html)
  end

  private

  def form_html
    File.read('test/fixtures/files/form_component_html.html').strip
  end
end
