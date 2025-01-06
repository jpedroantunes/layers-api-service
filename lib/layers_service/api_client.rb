require "uri"
require "net/http"
require "json"

module LayersService
  # Implement all Layers API calls
  class ApiClient
    def initialize(community_id)
      # Initialize base configuration to retrieve information from Layers's API
      @layers_routes = LayersRoutes.new(base_url: LayersService.configuration.base_url)
      @layers_app_token = LayersService.configuration.layers_token
      @community_id = community_id
      return unless @layers_app_token.nil?

      raise "It is mandatory to define the environment variables: 'LAYERS_TOKEN'"
    end

    def get_user_by_id(user_id)
      url = URI("#{@layers_routes.users_route}/#{user_id}")
      https = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Get.new(url)
      request["community-id"] = @community_id
      request["Content-Type"] = "application/json"
      request["Authorization"] = "Bearer #{@layers_app_token}"
      LayersResponse.new(https.request(request))
    end

    def inspect
      "#<LayersService::ApiClient>"
    end
  end
end
