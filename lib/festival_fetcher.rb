require 'net/http'

class FestivalFetcher
  def self.fetch
      url = URI(Rails.application.config.predicthq_url)
      url.query = URI.encode_www_form("query" => "festival")
      req = Net::HTTP::Get.new(url.to_s)
      req.add_field 'Authorization', "Bearer #{Rails.application.config.predicthq_token}"
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      puts JSON.parse(res.body)
  end
end