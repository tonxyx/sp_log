module Input
  class MainInput
    attr_accessor :data

    def load_data
      raise NotImplementedError, 'You must implement the input method for your input data type'
    end
  end
end
