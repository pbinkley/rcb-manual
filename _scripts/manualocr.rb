#!/usr/bin/env ruby

# arg is canvas id
# url is like https://iiif.archivelab.org/iiif/manualonmethodso00robe$3/full/full/0/default.jpg

require 'byebug'
require 'rtesseract'
require 'clipboard'
require 'open-uri'
require 'rmagick'

include Magick

url = "https://iiif.archivelab.org/iiif/manualonmethodso00robe$#{ARGV[0]}/full/full/0/default.jpg"
filename = './ocr.png'

File.open(filename, 'wb') do |fo|
  fo.write URI.open(url).read 
end

if ARGV[1] 
  image = ImageList.new(filename)
  image.rotate!(ARGV[1].to_i)
  image.write(filename)
end

image = RTesseract.new(filename, config_file: 'psm 6')
input = image.to_s # Getting the value

Clipboard.copy input
# File.delete(filename)

puts 'OCR text copied to clipboard'
