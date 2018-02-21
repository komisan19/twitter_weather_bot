require 'net/http'
require 'uri'
require 'dotenv'
require 'json'
require 'twitter'

# Twitter認証
Dotenv.load
@client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
	config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
	config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

# livedoor天気より
  uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010') #=> 千葉
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

   today = result['forecasts'][1]['telop']
   max = result['forecasts'][1]['temperature']['max']['celsius']
   min = result['forecasts'][1]['temperature']['min']['celsius']
   publictime = result['description']['publicTime']

  @client.update("【定期】\n明日の千葉の天気は#{today}、気温は#{max}/#{min} \n発表時刻#{publictime}")
