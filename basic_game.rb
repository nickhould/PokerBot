require 'net/http'
require "awesome_print"
require 'json'

def game_state(key)
  base_url = URL
  request_url =  base_url + key
  url = URI.parse(request_url)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  response = res.body
  JSON.parse(response)
end

def post_response(key, action)
	response_url = URL + key + '/action'
	url = URI.parse(response_url)
	postData = Net::HTTP.post_form(url, action)																				 
end




