require 'net/http'

class FestivalFetcher
  def self.fetch
      url = URI.parse(Rails.application.config.predicthq_url)
      url.query = URI.encode_www_form("q" => "festival")
      
      req = Net::HTTP::Get.new(url.to_s)
      req.initialize_http_header({'Authorization'=>"Bearer #{ENV["PREDICTHQ_SECRET"]}"})
      https = Net::HTTP.start(url.host, url.port, :use_ssl => true)
      
      res = https.request(req)
      if res.code == "301"
        url = URI.parse(res.header['location'])
        url.query = URI.encode_www_form("q" => "festival")
        req = Net::HTTP::Get.new(url.to_s)
        req.initialize_http_header({'Authorization'=>"Bearer #{ENV["PREDICTHQ_SECRET"]}"})
        res = https.request(req)
      end
      return JSON.parse(res.body)["results"]
  end
end
