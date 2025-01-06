# frozen_string_literal: true

# Class encapsulating all available Layers Routes
class LayersRoutes
  def initialize(base_url:)
    @layers_base_url = base_url
    return unless @layers_base_url.nil?

    raise "The Layers Base URL 'LAYERS_URL' may be defined as an environment variable"
  end

  def users_route
    "#{@layers_base_url}/users"
  end
end
