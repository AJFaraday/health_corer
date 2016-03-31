require_relative 'spec_helper'

describe Fetcher do

  before(:each) do
    spec_data = File.read('spec_export.xml')
    allow(File).to(
      receive(:read).and_return(
        OpenStruct.new(read: spec_data)
      )
    )
    @fetcher = Fetcher.new
  end

  it 'should have the weight records' do
    collection = @fetcher.data('weight')
    collection.should be_a(Weight::Collection)
    collection.data_points.count.should eq(4)
  end

  it 'should have the distance records' do
    collection = @fetcher.data('distance')
    collection.should be_a(Distance::Collection)
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