require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    assert_generates('/', { controller: 'entries', action: 'index' })
  end

  test "create" do
    assert_generates('/entries.turbo_stream', { controller: 'entries', action: 'create', format: 'turbo_stream' })
  end
end
