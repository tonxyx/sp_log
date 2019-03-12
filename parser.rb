require 'pry'
require_relative 'lib/input/server_log_input.rb'
require_relative 'lib/output/console_output.rb'
require_relative 'lib/calculator.rb'

raise ArgumentError, 'Argument is not string' unless ARGV[0].is_a? String

input_data = Input::ServerLogInput.new(ARGV[0]).data

calc = Calculator.new
visits = calc.calculate_visits(input_data.data)
unique_visits = calc.calculate_unique_visits(input_data.data)

console = Output::ConsoleOutput.new
console.print_visits(visits)
console.print_unique_visits(unique_visits)
