class WardrobeItem
  attr_reader :type, :name, :temperature_range

  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temperature_range = params[:temperature_range]
  end

  def suits_the_weather?(input)
    @temperature_range.include?(input)
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature_range}"
  end
end
