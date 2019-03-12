module Output
  class MainOutput
    def print_visits(data, sort = true)
      raise NotImplementedError, 'You must implement the output method "print_visits"'
    end

    def print_unique_visits(data, sort = true)
      raise NotImplementedError, 'You must implement the output method "print_unique_visits"'
    end
  end
end
