require_relative 'lib/log_parser.rb'

raise ArgumentError, 'Argument is not string' unless ARGV[0].is_a? String
parser = LogParser.new(ARGV[0])
parser.print_statistics
