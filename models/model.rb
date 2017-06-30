require 'net/http'
require 'json'
require 'rubygems'

def makeupproduct(search_term, product_tag)
	new_search_term = search_term.gsub(" ", "+")
	new_tag = product_tag.gsub(" ", "+")
	request_string = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=#{search_term}&product_tags=#{new_tag}"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	puts sample_parsedResponse
	if sample_parsedResponse.length==0
		"Sorry, no products found. Please try again!"
	else 
	name=sample_parsedResponse[0]["name"]
	price=sample_parsedResponse[0]["price"]
	description=sample_parsedResponse[0]["description"]
	image_link=sample_parsedResponse[0]["image_link"]
	product_link=sample_parsedResponse[0]["product_link"]

		return [name, price, description, image_link, product_link]
	end
end