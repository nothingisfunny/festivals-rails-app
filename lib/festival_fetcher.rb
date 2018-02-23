require 'net/http'

class FestivalFetcher
  def self.fetch(query)
 
      url = URI(Rails.application.config.search_url)
      url.query = URI.encode_www_form("query" => query, "placeholder" => placeholder)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      return JSON.parse(res.body)

  end
end