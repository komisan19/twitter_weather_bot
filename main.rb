require 'net/http'
require 'uri'
require 'json'
require 'twitter'

# Twitter認証
@client = Twitter::REST::Client.new do |config|
  config.consumer_key = "LedTYV0iVpX3MBxTUGabpnv7K"
	config.consumer_secret = "upvJ81xSJPnLQMnRE1QdyGRMWqpSRxUtLVA9Iv4frf5LxndoBw"
	config.access_token = "3107019086-7PUTTZphonJjw1tD4KOcxnEtHT4QD29RWkOC0fd"
	config.access_token_secret = "oXVAhicZ4yTulqpL7AczHWM0Z1bBQ0w5J66AMwtetNNKO"
end

# livedoor天気より
  uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010')
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

   today = result['forecasts'][1]['telop']
   max = result['forecasts'][1]['temperature']['max']['celsius']
   min = result['forecasts'][1]['temperature']['min']['celsius']
   publictime = result['description']['publicTime']

  #@client.update("明日の千葉の天気は#{today}、気温は#{max}/#{min}")

  @client.update("【定期】\n明日の千葉の天気は#{today}、気温は#{max}/#{min} \n発表時刻#{publictime}")
