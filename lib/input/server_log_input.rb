require 'pry'
require_relative 'main_input.rb'

module Input
  class ServerLogInput < MainInput

    def initialize(filename)
      self.data = load_data(filename)
    end

    def load_data(filename)
      data = {}
      File.foreach(filename).with_index do |line, line_num|
        parts = line.split(" ")
        data[line_num] = {
          url: parts[0],
          ip: parts[1],
        }
      end

      data
    end
  end
end
