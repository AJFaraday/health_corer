require_relative 'spec_helper'

describe Fetcher do


  before(:each) do
    allow_any_instance_of(Fetcher).to(
      receive(:input_file_path)
    ).and_return(
      File.join(
        File.dirname(__FILE__),
        'spec_export.xml'
      )
    )

    Config::FILE_PATH = File.dirname(__FILE__) + '/spec_config.yml'

    @fetcher = Fetcher.new
  end

  it 'should have a config object' do
    @fetcher.config.should be_a(Config)
  end

  it 'should have the weight records' do
    collection = @fetcher.data('weight')
    collection.should be_a(Weight::Collection)
    collection.data_points.count.should eq(4)
  end

  it 'should have the distance records' do
    collection = @fetcher.data('distance')
    collection.should be_a(Distance::Collection)
    puts collection.data_points
    collection.data_points.count.should eq(4)
  end

  it 'should have the stairs records' do
    collection = @fetcher.data('stairs')
    collection.should be_a(Stairs::Collection)
    collection.data_points.count.should eq(4)
  end

  it 'should have the steps records' do
    collection = @fetcher.data('steps')
    collection.should be_a(Steps::Collection)
    collection.data_points.count.should eq(4)
  end

end
