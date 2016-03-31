require_relative './lib/environment.rb'

puts "#{Time.now.to_s} Starting parse"

p = Nori.new
x = p.parse(File.open('export.xml').read)
records = x['HealthData']['Record']

puts "#{Time.now.to_s} Finished parse"

step_count_data = records.collect{|x| x['@type'] == 'HKQuantityTypeIdentifierStepCount' }
weight_data = records.collect{|x| x['@type'] == 'HKQuantityTypeIdentifierBodyMass' }
stairs_data = records.collect{|x| x['@type'] == 'HKQuantityTypeIdentifierFlightsClimbed' }
distance_data = records.collect{|x| x['@type'] == 'HKQuantityTypeIdentifierDistanceWalkingRunning' }

puts "#{Time.now.to_s} collected data"
