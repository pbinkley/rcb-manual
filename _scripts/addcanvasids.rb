#!/usr/bin/env ruby

require 'csv'
require 'byebug'

toc = CSV.parse(File.read("tables.csv"), headers: true)
pages = CSV.parse(File.read("pages.csv"), headers: true)

toc.each do |entry|
  canvas = pages.find {|x| x['label'] == "p.#{entry['page']}"}['canvas']
  entry['canvas'] = canvas
end

CSV.open('test.csv', 'w') { |csv| 
  csv << toc.headers
  toc.each{|row| csv << row}
}

puts 'done'
