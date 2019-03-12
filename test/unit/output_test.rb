require_relative '../../lib/output/console_output.rb'
require "test/unit"

class OutputTest < Test::Unit::TestCase

  def setup
    @visits = {"/contact": 89, "/home": 78, "/index": 82, "/about": 81}
    @unique_visits = {
      "/contact 336.284.013.698": 3,
      "/home 123.234.345.456": 1,
      "/index 336.284.013.698": 5,
      "/about 336.284.013.698": 8
    }
    @console = Output::ConsoleOutput.new
  end

  def test_console_output
    assert "Webpage visits:
      /contact: 89 visits
      /index: 82 visits
      /about: 81 visits
      /home: 78 visits",
      @console.print_visits(@visits)
      
    assert "Webpage unique visits:
      /about 336.284.013.698: 8 unique views
      /index 336.284.013.698: 5 unique views
      /contact 336.284.013.698: 3 unique views
      /home 123.234.345.456: 1 unique views",
      @console.print_unique_visits(@unique_visits)
  end

end
