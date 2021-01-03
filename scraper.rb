# you shouldn't need to require these gems but just in case:
require 'open-uri'
require 'net/http'
require 'json'
require 'httparty'
require 'tempfile'
require 'nokogiri'
require 'csv'

# target URL
url = "https://en.wikipedia.org/wiki/Douglas_Adams"

# assigns an instance of URI’s subclass from the string to 'uri'
uri = URI.parse(url)
# can also be written as URI(url)
# puts uri.class

# takes an instance of URI's subclass
# sends a GET request to url contained in uri
# returns HTTP response as a Net::HTTPResponse object
response1 = Net::HTTP.get_response(uri)
# puts response1

# puts response.body

# sends a GET request to URL
# returns an HTTParty::Reponse object, a collection of strings representing the site's HTML
html1 = HTTParty.get(url)
# puts html1.class

# using open-uri
# returns a Tempfile instance
html2 = open(url)
# puts html2.class

response2 = Nokogiri::HTML(html2)
#returns the contents of the title element
# puts response2.title
p response2.css("p")[1]

# description = doc.css("p").text


html = open(url)
doc = Nokogiri::HTML(html)

data_arr = []
description = doc.css("p").text.split("\n").find{|e| e.length > 0}
picture = doc.css("td a img").find{|picture| picture.attributes["alt"].value.include?("Douglas adams portrait cropped.jpg")}.attributes["src"].value

data_arr.push([description, picture])

CSV.open('data.csv', "w") do |csv|
  csv << data_arr
end