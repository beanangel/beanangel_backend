require 'test_helper'

class SearchControllerTest < ActionController::TestCase

  setup do
    @searches = YAML.load_file('test/fixtures/searches.yml')
  end

  test "should post create" do
    search = Search.new(@searches['köln'])
    post :create, query: search.query
    assert_response :success
  end

end
