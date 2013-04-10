require './team_city_http_connection'
require 'json'

class TeamCityApi
  def initialize(connection)
    @connection = connection
  end
  
  def authenticate(username,password)
    @username,@password =username,password
  end

  def get_all_projects
    JSON.parse @connection.use_connection("/httpAuth/app/rest/projects").body
  end

  def get_project_details_by_id(project_id)
    JSON.parse @connection.use_connection("/httpAuth/app/rest/projects/id:#{project_id}").body
  end
  
  def get_project_details_by_name(project_name)
    JSON.parse @connection.use_connection("/httpAuth/app/rest/projects/name:#{project_name}").body
  end

  def get_build_configuration_for_project_by_id(project_id)
    JSON.parse @connection.use_connection("/httpAuth/app/rest/projects/id:#{project_id}/buildTypes").body
  end

  def get_build_configuration_for_project_by_name(project_name)
    JSON.parse @connection.use_connection("/httpAuth/app/rest/projects/name:#{project_name}/buildTypes").body
  end

end


api_connector = TeamCityHttpConnection.new('teamcity.codebetter.com',80,'teamcitysharpuser','qwerty')
teamcityapi = TeamCityApi.new(api_connector)

#puts teamcityapi.get_all_projects
#puts teamcityapi.get_project_details_by_id 'project115'
#puts teamcityapi.get_project_details_by_name 'easyhttp'
#puts teamcityapi.get_build_configuration_for_project_by_id 'project115'
#puts teamcityapi.get_build_configuration_for_project_by_name 'easyhttp'
