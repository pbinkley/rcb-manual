require 'csv'
require 'byebug'

input = CSV.parse(File.read('pages.csv'), headers: true, converters: :numeric)

input.each do |row|
	if row['canvas'] == 0
		row['ia_page'] = ''
	elsif row['page'].is_a? Integer
		row['ia_page'] = "#{row['page']}\/"
	else
		row['ia_page'] = "n#{row['canvas']-1}\/"
	end
end

CSV.open("new_pages.csv", "w") do |csv|
  csv << input.first.headers
  input.each do |row|
    csv << row
  end
end
puts 'done'