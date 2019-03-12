require 'pry'

class Calculator

  def calculate_visits(data)
    webpage_visits = {}

    data.each do |index, item|
      if webpage_visits.key?(item[:url])
        webpage_visits[item[:url]] += 1
      else
        webpage_visits[item[:url]] = 1
      end
    end

    webpage_visits
  end

  def calculate_unique_visits(data)
    webpage_unique_visits = {}

    data.each do |index, item|
      data_key = "#{item[:url]} #{item[:ip]}"
      if webpage_unique_visits.key?(data_key)
        webpage_unique_visits[data_key] += 1
      else
        webpage_unique_visits[data_key] = 1
      end
    end

    webpage_unique_visits
  end
end
