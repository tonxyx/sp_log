require_relative '../../lib/log_parser.rb'
require "test/unit"

class ParserTest < Test::Unit::TestCase

  def setup
    @parser = LogParser.new('webserver.log')
  end

  def test_parser_failure_no_argument
    assert_raise(ArgumentError) { LogParser.new() }
  end

  def test_parser_failure
    assert_not_equal(90, @parser.visits.first.first[1])
  end

  def test_parser_max_visits
    assert_equal(90, @parser.visits.first.max_by{|k,v| v}[1])
  end

  def test_parser_visits_hash_size
    assert_equal(6, @parser.visits.first.size)
  end

  def test_parser_max_unique_visits
    assert_equal(10, @parser.visits.last.max_by{|k,v| v}[1])
  end

  def test_parser_unique_visits_hash_size
    assert_equal(135, @parser.visits.last.size)
  end
end
