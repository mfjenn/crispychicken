class Geolocator
  attr_reader :latitude, :longitude
  
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def to_s
    "Current position latitude = #{self.latitude} and longitude = #{self.longitude}"
  end
end
