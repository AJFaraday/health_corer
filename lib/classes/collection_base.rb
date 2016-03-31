class CollectionBase

  attr_reader :data_points

  def initialize(raw_data)
    init_raw_data(raw_data)
    init_data_points
  end

  private

  def init_raw_data(raw_data)
    record_identifier = self.class::RECORD_IDENTIFIER
    @raw_data = raw_data.select{|x|x['@type'] == record_identifier}
  end

  def init_data_points
    module_name = self.class.to_s.split('::')[0]
    data_point_class = Kernel.const_get("#{module_name}::DataPoint")
    @data_points = @raw_data.collect do |raw_data_point|
      data_point_class.new(raw_data_point)
    end
  end

end
