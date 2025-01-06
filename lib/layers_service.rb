# frozen_string_literal: true

require_relative "layers_service/version"

# Implement all Layers API calls
module LayersService
  autoload :ApiClient, "layers_service/api_client"
  autoload :LayersRoutes, "layers_service/layers_routes"
  autoload :LayersResponse, "layers_service/layers_response"

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # Implement Layers Service configuration
  class Configuration
    attr_reader :base_url, :layers_token

    def initialize
      @base_url = ""
      @layers_token = ""
    end

    def set_configuration(base_url:, layers_token:)
      @base_url = base_url
      @layers_token = layers_token
    end
  end
end
