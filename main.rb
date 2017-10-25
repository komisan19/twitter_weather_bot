require 'net/http'
require 'uri'
require 'json'
require 'twitter'

# Twitter認証
@client = Twitter::REST::Client.new do |config|
  config.consumer_key = "Your key"
	config.consumer_secret = "Your key"
	config.access_token = "Your key"
	config.access_token_secret = "Your key"
end

# livedoor天気より
  uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010')　#=> 千葉
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

   today = result['forecasts'][1]['telop']
   max = result['forecasts'][1]['temperature']['max']['celsius']
   min = result['forecasts'][1]['temperature']['min']['celsius']
   publictime = result['description']['publicTime']

  @client.update("【定期】\n明日の千葉の天気は#{today}、気温は#{max}/#{min} \n発表時刻#{publictime}")
