require_relative 'spec_helper'

describe CsvWriter do

  def clean_up_file
    FileUtils.rm(
      File.join(
        File.dirname(__FILE__),
        '..', 'output',
        'spec_output.csv'
      )
    )
  end

  let(:csv_writer) do
    CsvWriter.new(
      'spec_output.csv',
      ['date', 'weight'],
      [
        OpenStruct.new({date: '2015-03-08', weight: '110'}),
        OpenStruct.new({date: '2015-03-09', weight: '111'}),
        OpenStruct.new({date: '2015-03-10', weight: '112'})
      ]
    )
  end

  it 'should initialise with a file name, headers and data' do
    csv_writer.file_name.should eq('spec_output.csv')
    csv_writer.headers.should eq(['date', 'weight'])

    csv_writer.data.should be_an(Array)
    csv_writer.data[0].should eq(OpenStruct.new({date: '2015-03-08', weight: '110'}))
    csv_writer.data[1].should eq(OpenStruct.new({date: '2015-03-09', weight: '111'}))
    csv_writer.data[2].should eq(OpenStruct.new({date: '2015-03-10', weight: '112'}))
  end

  it 'should write the data to a readable file' do
    File.should_not exist("#{File.dirname(__FILE__)}/../output/spec_output.csv")
    csv_writer.write_file
    File.should exist("#{File.dirname(__FILE__)}/../output/spec_output.csv")

    data = CSV.read("#{File.dirname(__FILE__)}/../output/spec_output.csv")
    data.should be_a(Array)
    data[0].should eq(['date', 'weight'])
    data[1].should eq(['2015-03-08', '110'])
    data[2].should eq(['2015-03-09', '111'])
    data[3].should eq(['2015-03-10', '112'])

    clean_up_file
  end

end
