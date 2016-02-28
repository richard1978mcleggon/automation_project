module DataHelper
  # Read basics on YAML - http://www.seleniumframework.com/test-data/test-data-with-yaml/
  def data_yml_hash
    @data_yml = YAML.load_file "#{data_default_directory}/#{yml_file}"
  end

  def data_yml_hash_random
    DataMagic.yml_directory = data_default_directory
    @data_yml = DataMagic.load "user.yml"
  end

  # Read basics on excel parsing - http://www.seleniumframework.com/test-data/test-data-with-excel/
  def data_excel_hash (data_sheet,row_index=2)
    workbook = RubyXL::Parser.parse "#{data_default_directory}/#{excel_file}"
    sheet = workbook[data_sheet]
    header_row = sheet.sheet_data[0]
    header_array = Array.new
    header_row.size.times do |i|
      header_array << header_row[i].value
    end
    @data_excel = sheet.get_table(header_array)[:table]
    @data_excel[row_index.to_i-2]
  end
  # Json parsing reference - http://www.seleniumframework.com/test-data/test-data-with-json/
  def data_json_hash
    @data_json = JSON.parse "#{data_default_directory}/#{json_file}"
  end
  def set_data_directory(dir)
    @data_directory = dir
  end

  private
  def yml_file
    ENV['DATA_YML_FILE']? ENV['DATA_YML_FILE'] : 'default.yml'
  end

  def excel_file
    ENV['DATA_EXCEL_FILE']?ENV['DATA_EXCEL_FILE'] : 'default.xlsx'
  end

  def json_file
    ENV['DATA_JSON_FILE']?ENV['DATA_JSON_FILE'] : 'default.json'
  end

  def xml_file
    ENV['DATA_XML_FILE']?ENV['DATA_XML_FILE'] : 'default.xml'
  end

  def data_default_directory
    @data_directory ||= './lib/config/data'
  end

  class << self
    attr_accessor :data_yml,:data_excel,:data_json,:data_xml, :data_directory
  end
end