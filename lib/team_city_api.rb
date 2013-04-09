require 'net/http'

class TeamCityApi
  def initialize

  end
  
  def authenticate(username,password)
    @username,@password =username,password
  end

  def get_all_projects
        Net::HTTP.start('teamcity.codebetter.com',80) do |http|
          req = Net::HTTP::Get.new('/httpAuth/app/rest/projects')
          req.basic_auth(@username,@password)
          req.add_field('Accept','Application/json')
          response = http.request(req)
          puts response.body
        end

  end

  def get_project_details(project_id)

  end

  def get_build_configuration_for_project(project_id)

  end
end

#to test this class
#api = TeamCityApi.new
#api.authenticate('teamcitysharpuser','qwerty')

#api.get_all_projects