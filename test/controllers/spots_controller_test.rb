require 'test_helper'

class SpotsControllerTest < ActionController::TestCase

  setup do
    @spots = YAML.load_file('test/fixtures/spots.yml')
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should post create" do
    spot = Spot.new(@spots['standard'])
    post :create, spot: spot.attributes.except(:id)
    assert_response :success
  end

  test "should post update" do
    spot = Spot.create!(@spots['standard'])
    post :update, id: spot.id, spot: spot.attributes.except(:id)
    assert_response :success
  end
end
