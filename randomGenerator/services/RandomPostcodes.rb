require 'httparty'
require 'json'

class RandomPostcodes
  include HTTParty
  base_uri 'http://api.postcodes.io'
def random_array(number_of_postcodes)
  #return array with specifed number of postcodes inside

  array = []

  number_of_postcodes.times do 
   array << generate_random_postcode
  end
array
end

 def generate_random_postcode
   json_result = JSON.parse(self.class.get('/random/postcodes').body)
   json_result['result']['postcode']
 end

end

test = RandomPostcodes.new
 p test.random_array(rand(2..10))
 