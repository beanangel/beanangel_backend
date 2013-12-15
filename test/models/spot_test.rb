require 'test_helper'

class SpotTest < ActiveSupport::TestCase

  setup do
    @spots = YAML.load_file('test/fixtures/spots.yml')
  end

  required_fields = [:title, :location, :username]

  required_fields.each do |field|
    test "doesn't save without a #{field}" do
      spot = Spot.new(@spots['standard'])
      spot.send("#{field}=", nil)
      assert !spot.save, "shouldn't save without a #{field}"
    end
  end

end
