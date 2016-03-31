class Fetcher

  attr_reader :config

  def initialize
    @config = Config.new
    @raw_data = get_raw_data
    @data_types = {}
    @cached_data = {}
  end

  def data(type)
    return @cached_data[type] if @cached_data[type]
    collection_class = get_data_type(type).collection_class
    @cached_data[type] = collection_class.new(@raw_data)
  end

  private

  def get_data_type(type)
    return @data_types[type] if @data_types[type]
    @data_types[type] = @config.data_type(type)
  end

  def get_raw_data
    records = Nori.new.parse(File.open(input_file_path).read)
    records['HealthData']['Record']
  end

  def input_file_path
    File.join(
      File.dirname(__FILE__),
      '..',
      '..',
      'input',
      @config.input_file
    )
  end


end
