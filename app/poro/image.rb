class Image
  attr_reader :image
  def initialize(info)
    @image = info[:data][0][:images][:downsized_large][:url]
  end
end
