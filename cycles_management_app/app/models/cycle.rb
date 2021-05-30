class Cycle < ApplicationRecord

  def build_component
    v = self.components.dup
    v << Component.new({name: ''})
    self.components = v
  end
  

	def components
    read_attribute(:components).map {|v| Component.new(v) }
  end

  def components_attributes=(attributes)
    components = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      attrs[:name] = attrs[:name].try(:to_s)
      attrs[:impacts] = attrs[:impacts].try(:to_json)
      components << attrs
    end
    write_attribute(:components, components)
  end

end
