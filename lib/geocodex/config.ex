defmodule Geocodex.Config do
  @moduledoc false

  def geocode_api_url do
    Application.fetch_env! :geocodex, :geocode_api_url
  end

  def api_key do
    Application.fetch_env! :geocodex, :api_key
  end

  def api_key(api_key) do
    Application.put_env :geocodex, :api_key, api_key
  end
end
