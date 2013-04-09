require './team_city_http_connection'


class TeamCityApi
  def initialize(connection)
    @connection = connection
  end
  
  def authenticate(username,password)
    @username,@password =username,password
  end

  def get_all_projects
    @connection.use_connection("/httpAuth/app/rest/projects").body
  end

  def get_project_details_by_id(project_id)
    @connection.use_connection("/httpAuth/app/rest/projects/id:#{project_id}").body
  end
  
  def get_project_details_by_name(project_name)
  
  end

  def get_build_configuration_for_project(project_id)

  end
end


api_connector = TeamCityHttpConnection.new('teamcity.codebetter.com',80,'teamcitysharpuser','qwerty')
teamcityapi = TeamCityApi.new(api_connector)

puts teamcityapi.get_all_projects
puts teamcityapi.get_project_details_by_id 'project115'
#to test this class
#api = TeamCityApi.new
#api.authenticate('teamcitysharpuser','qwerty')

#api.get_all_projects
#api.get_project_details_by_id('project115')
