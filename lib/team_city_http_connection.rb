require 'net/http'

class TeamCityHttpConnection
  def initialize(uri,port,username,password)
    @uri,@port,@username,@password = uri,port,username,password
  end
  def use_connection(url)
    Net::HTTP.start(@uri,@port) do |http|
      req = Net::HTTP::Get.new(url)
      req.basic_auth(@username,@password)
      req.add_field('Accept','Application/json')
      http.request(req)
    end
  end
end