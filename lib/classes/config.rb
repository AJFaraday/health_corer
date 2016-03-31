class Config

  FILE_PATH = File.dirname(__FILE__) + '/../../config.yml'

  attr_reader :input_file,
              :data_types,
              :start_date,
              :ignore_start_date

  def initialize
    raw_data = YAML.load_file(FILE_PATH)
    @input_file = raw_data['input_file']
    @start_date = raw_data['start_date']
    @ignore_start_date = raw_data['ignore_start_date']
    init_data_types(raw_data['data_types'])
  end

  def data_type(name)
    data_types.detect { |x| x.type == name }
  end

  private

  def init_data_types(data)
    @data_types = data.collect do |source|
      ConfigDataType.new(source)
    end
  end

end
