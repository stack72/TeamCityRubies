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

  def get_project_details_by_id(project_id)
      Net::HTTP.start('teamcity.codebetter.com',80) do |http|
          req = Net::HTTP::Get.new("/httpAuth/app/rest/projects/id:#{project_id}")
          req.basic_auth(@username,@password)
          req.add_field('Accept','Application/json')
          response = http.request(req)
          puts response.body
        end
  end
  
  def get_project_details_by_name(project_name)
    Net::HTTP.start('teamcity.codebetter.com',80) do |http|
      req = Net::HTTP::Get.new("/httpAuth/app/rest/projects/name:#{project_name}")
      req.basic_auth(@username,@password)
      req.add_field('Accept','Application/json')
      response = http.request(req)
      puts response.body
    end
  end

  def get_build_configuration_for_project_by_id(project_id)
    Net::HTTP.start('teamcity.codebetter.com',80) do |http|
      req = Net::HTTP::Get.new("/httpAuth/app/rest/projects/id:#{project_id}/buildTypes")
      req.basic_auth(@username,@password)
      req.add_field('Accept','Application/json')
      response = http.request(req)
      puts response.body
    end
  end

  def get_build_configuration_for_project_by_name(project_name)
    Net::HTTP.start('teamcity.codebetter.com',80) do |http|
      req = Net::HTTP::Get.new("/httpAuth/app/rest/projects/name:#{project_name}/buildTypes")
      req.basic_auth(@username,@password)
      req.add_field('Accept','Application/json')
      response = http.request(req)
      puts response.body
    end
  end
end

#to test this class
api = TeamCityApi.new
api.authenticate('teamcitysharpuser','qwerty')

#api.get_all_projects
#api.get_project_details_by_id('project115')
#api.get_project_details_by_name('easyhttp')
#api.get_build_configuration_for_project_by_id('project115')
api.get_build_configuration_for_project_by_name('easyhttp')