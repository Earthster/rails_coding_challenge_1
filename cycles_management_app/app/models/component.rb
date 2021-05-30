class Component
  attr_accessor :name, :impacts

  def impacts
    read_attribute(:impacts).map {|v| Impact.new(v) }
  end

  def initialize(hash)
    @name = hash['name']
  end

  def persisted?() false; end
  def new_record?() false; end
  def marked_for_destruction?() false; end
  def _destroy() false; end


  class Impact
    attr_accessor :climate_change, :water_use

    def initialize(hash)
      @climate_change = hash['climate_change'].to_i
      @water_use      = hash['water_use'].to_i
    end
  end
end