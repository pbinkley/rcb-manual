#!/usr/bin/env ruby

require 'csv'
require 'byebug'

toc = CSV.parse(File.read("tables.csv"), headers: true)
pages = CSV.parse(File.read("pages.csv"), headers: true)

toc.each do |entry|
  canvas_id = pages.find {|x| x['label'] == "p.#{entry['page']}"}['canvas_id']
  entry['canvas_id'] = canvas_id
end

CSV.open('test.csv', 'w') { |csv| 
  csv << toc.headers
  toc.each{|row| csv << row}
}

puts 'done'
