require 'pry'

class LogParser
  attr_accessor :visits

  def initialize(file)
    self.visits = parse_log_file(file) || []
  end

  def parse_log_file(file)
    webpage_visits = {}
    webpage_unique_visits = {}

    File.readlines(file).each do |line|
      # webpage visits (non unique by ip)
      line_parts = line.split(" ")
      if webpage_visits.key?(line_parts.first)
        webpage_visits[line_parts.first] += 1
      else
        webpage_visits[line_parts.first] = 1
      end

      # webpage unique visits
      if webpage_unique_visits.key?(line)
        webpage_unique_visits[line] += 1
      else
        webpage_unique_visits[line] = 1
      end
    end

    [webpage_visits, webpage_unique_visits]
  end

  def print_statistics
    puts "Webpage visits:\n"
    webpage_visits = self.visits.first.sort_by {|k, v| v}.reverse.to_h
    puts webpage_visits.map{|k,v| "#{k} #{v} visits"}.join("\n")

    puts "\nWebpage unique visits:\n"
    unique_visits = self.visits.last.sort_by {|_key, value| value}.reverse.to_h
    puts unique_visits.map{|k,v| "#{k.strip} #{v} unique views"}.join("\n")
  end
end
