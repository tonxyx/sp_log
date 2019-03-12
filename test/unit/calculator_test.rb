require_relative '../../lib/calculator.rb'
require "test/unit"
require "pry"

class CalculatorTest < Test::Unit::TestCase

  def setup
    @data = {
      0=>{:url=>"/help_page/1", :ip=>"126.318.035.038"},
      1=>{:url=>"/contact", :ip=>"184.123.665.067"},
      2=>{:url=>"/home", :ip=>"184.123.665.067"},
      3=>{:url=>"/about", :ip=>"061.945.150.735"},
      4=>{:url=>"/help_page/1", :ip=>"929.398.951.889"},
      5=>{:url=>"/index", :ip=>"444.701.448.104"},
      6=>{:url=>"/help_page/1", :ip=>"722.247.931.582"},
      7=>{:url=>"/about", :ip=>"061.945.150.735"},
      8=>{:url=>"/help_page/1", :ip=>"646.865.545.408"},
      9=>{:url=>"/home", :ip=>"235.313.352.950"}
    }
    @calc = Calculator.new
  end

  def test_calculator_visits
    visits = @calc.calculate_visits(@data)

    assert !visits.empty?
    assert visits.is_a? Hash
    assert visits == {"/help_page/1"=>4, "/contact"=>1, "/home"=>2, "/about"=>2, "/index"=>1}
  end

  def test_calculator_unique_visits
    unique_visits = @calc.calculate_unique_visits(@data)

    assert !unique_visits.empty?
    assert unique_visits.is_a? Hash

    uni_visits = {
      "/help_page/1 126.318.035.038"=>1,
      "/contact 184.123.665.067"=>1,
      "/home 184.123.665.067"=>1,
      "/about 061.945.150.735"=>2,
      "/help_page/1 929.398.951.889"=>1,
      "/index 444.701.448.104"=>1,
      "/help_page/1 722.247.931.582"=>1,
      "/help_page/1 646.865.545.408"=>1,
      "/home 235.313.352.950"=>1
    }
    assert unique_visits == uni_visits
  end
end
