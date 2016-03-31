class CsvWriter

  attr_reader :file_name, :headers, :data

  def initialize (file_name, headers, data)
    @file_name = file_name
    @headers = headers
    @data = data
  end

  def write_file
    file_path = File.join(
      File.dirname(__FILE__),
      '..',
      '..',
      'output',
      @file_name
    )
    rows = build_file_content
    CSV.open(file_path, "wb") do |csv|
       rows.each{|row| csv << row}
    end
  end

  private

  def build_file_content
    content = [@headers]
    data.each do |datum|
      content << @headers.collect do |header|
        datum.send(header)
      end
    end
    content
  end

end
