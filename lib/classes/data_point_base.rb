class DataPointBase

  ATTRIBUTES_FROM_XML = [
    "type",
    "sourceName",
    "unit",
    "creationDate",
    "startDate",
    "endDate",
    "value"
  ]

  ATTRIBUTES_FROM_XML.each { |attr| attr_reader attr }

  def initialize(data_hash)
    ATTRIBUTES_FROM_XML.each do |attr|
      instance_variable_set("@#{attr}", data_hash["@#{attr}"])
    end
  end

end
