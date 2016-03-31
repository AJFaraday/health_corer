require 'rubygems'
require 'nori'
require 'csv'
require 'yaml'
require 'ostruct'

Dir.glob(File.dirname(__FILE__) + '/classes/*.rb').each do |x|
  puts "loading #{x}"
  require x
end
Dir.glob(File.dirname(__FILE__) + '/classes/**/*.rb').each do |x|
  puts "loading #{x}"
  require x
end