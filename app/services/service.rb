class Service  
  class Result
    def initialize(data, error, message=nil)
      @data = data
      @error = error
      @message = message
    end

    attr_reader :data, :error, :message
  end

  def build_result(data, error, message=nil)
    Result.new(data, error, message)
  end
end