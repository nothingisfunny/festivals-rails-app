require 'net/https'

class FestivalFetcher
  def self.fetch
      url = URI.parse(Rails.application.config.predicthq_url)
      url.query = URI.encode_www_form("query" => "festival")
      headers = {
      'Authorization'=>"Bearer: #{ENV["PREDICTHQ_SECRET"]}",
      'Content-Type' =>'application/json',
      'Accept'=>'application/json'
        }
      req = Net::HTTP::Get.new(url.to_s)
      https = Net::HTTP.new(url.host, url.port, headers )
      https.use_ssl = true
      res = https.request(req)
      puts res
      # http = Net::HTTP.new(url.host, url.port)
      # http.use_ssl  = true
      
      # resp = http.get(req, headers)
      # puts resp
  end
end
