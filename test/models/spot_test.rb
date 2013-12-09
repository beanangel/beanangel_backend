require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  test "doesn't save without a location" do
    spot = Spot.new
    spot.location = nil
    assert !spot.save, "shouldn't save without a location"
  end
end
