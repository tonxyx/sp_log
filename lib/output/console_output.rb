require 'pry'
require_relative 'main_output.rb'

module Output
  class ConsoleOutput < MainOutput

    def print_visits(data, sort = true)
      webpage_visits = sort ? sort_data(data) : data

      puts "Webpage visits:\n"
      puts webpage_visits.map{|k,v| "#{k}: #{v} visits"}.join("\n")
    end

    def print_unique_visits(data, sort = true)
      unique_visits = sort ? sort_data(data) : data

      puts "\nWebpage unique visits:\n"
      puts unique_visits.map{|k,v| "#{k}: #{v} unique views"}.join("\n")
    end

    protected
      def sort_data(data)
        data.sort_by {|_key, value| value}.reverse.to_h
      end
  end
end
