class Weather
  attr_reader :temp_low, :temp_high, :summary, :date

  def initialize(info)
    @temp_high = info[:main][:temp_max]
    @temp_low = info[:main][:temp_min]
    @summary = info[:weather][0][:description]
    @date = Time.now
  end
end
