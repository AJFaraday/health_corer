require_relative 'spec_helper'

describe Config do

  before(:each) do
    Config::FILE_PATH = '../../spec/config.yml'
    @config = Config.new
  end

  it 'should respond to input_file' do
    @config.should respond_to?(:input_file)
    @config.input_file.should be_a(String)
    @config.input_file.should eq('export.xml')
  end

  it 'should respond to data_types' do
    @config.should respond_to?(:data_types)
    @config.data_types.should be_an(Array)
    @config.data_types[0].should be_a(ConfigDataType)
  end

  it 'should respond to start_date' do
    @config.should respond_to?(:start_date)
    @config.start_date.should be_a(Date)
    @config.start_date.should eq(Date.new('2015-03-08'))
  end

  it 'should respond to ignore_start_date' do
    @config.should respond_to?(:ignore_start_date)
    @config.ignore_start_date.should be_a(Boolean)
    @config.ignore_start_date.should be_true
  end

end