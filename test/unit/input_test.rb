require_relative '../../lib/input/server_log_input.rb'
require "test/unit"

class InputTest < Test::Unit::TestCase

  def test_server_log_input
    input_data = Input::ServerLogInput.new('webserver.log')

    assert !input_data.data.empty?
    assert input_data.data.is_a? Hash
    assert input_data.data.first.is_a? Array

    assert input_data.data[0].key? :url
    assert input_data.data[0].key? :ip
  end
end
