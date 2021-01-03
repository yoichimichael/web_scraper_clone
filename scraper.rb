# you shouldn't need to require these gems but just in case:
require 'open-uri'
require 'net/http'
require 'json'
# require 'awesome_print'

# target URL
url = "https://en.wikipedia.org/wiki/Douglas_Adams"

# assigns a URI’s subclass instance from the string to 'uri'
uri = URI.parse(url)
# can also be written as URI(url)

# sends a GET request to url contained in uri
# returns HTTP response as a Net::HTTPResponse object
response = Net::HTTP.get_response(uri)

puts response.body