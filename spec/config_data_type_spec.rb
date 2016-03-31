require_relative 'spec_helper'

describe ConfigDataType do

  it 'should initialise from a hash' do
    hash = {
      type: 'steps',
      file: 'steps.csv'
    }
    data_type = ConfigDataType.new(hash)
    data_type.type.should eq('steps')
    data_type.file.should eq('steps.csv')
  end

  it 'should know the collection class' do
    data_type = ConfigDataType.new(
      type: 'steps',
      file: 'steps.csv'
    )
    data_type.collection_class.should(
      eq(Steps::Collection)
    )
  end

  it 'should know the data point class' do
    data_type = ConfigDataType.new(
      type: 'steps',
      file: 'steps.csv'
    )
    data_type.data_point_class.should(
      eq(Steps::DataPoint)
    )
  end

end