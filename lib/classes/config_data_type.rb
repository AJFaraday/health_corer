class ConfigDataType

  attr_reader :type, :file, :identifier

  IDENTIFIERS = {
    weight: 'HKQuantityTypeIdentifierBodyMass',
    steps: 'HKQuantityTypeIdentifierStepCount',
    stairs: 'HKQuantityTypeIdentifierFlightsClimbed',
    distance: 'HKQuantityTypeIdentifierDistanceWalkingRunning'
  }

  def initialize(hash)
    @type = hash['type']
    @file = hash['file']
    @identifier = IDENTIFIERS[@type.to_sym]
  end

  def collection_class
    mod = Kernel.const_get(type.capitalize)
    mod.const_get('Collection')
  end

  def data_point_class
    mod = Kernel.const_get(type.capitalize)
    mod.const_get('DataPoint')
  end

end

